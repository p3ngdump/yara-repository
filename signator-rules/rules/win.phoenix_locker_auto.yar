rule win_phoenix_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.phoenix_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.phoenix_locker"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 7b75 de2e 5c 56 a817 }
            // n = 5, score = 200
            //   7b75                 | call                dword ptr [ebx + 0x60]
            //   de2e                 | dec                 eax
            //   5c                   | mov                 ecx, dword ptr [0xffe55c82]
            //   56                   | dec                 esp
            //   a817                 | lea                 ecx, [eax + 0x10]

        $sequence_1 = { 488b442418 48c7442418399cefa9 f5 0f805660faff 809c240800000051 48818424000000009f232b1b f69c2408000000 }
            // n = 7, score = 200
            //   488b442418           | in                  eax, dx
            //   48c7442418399cefa9     | push    edi
            //   f5                   | cli                 
            //   0f805660faff         | sub                 ch, byte ptr [ebp - 0x5aa0ecfd]
            //   809c240800000051     | cwde                
            //   48818424000000009f232b1b     | sbb    al, 0xe2
            //   f69c2408000000       | pop                 ecx

        $sequence_2 = { 68a5136b05 5a 5e 5e 5a 4159 4159 }
            // n = 7, score = 200
            //   68a5136b05           | seta                ch
            //   5a                   | inc                 ecx
            //   5e                   | mov                 al, 0xa7
            //   5e                   | dec                 eax
            //   5a                   | cmp                 edi, ebx
            //   4159                 | je                  0x4a3
            //   4159                 | dec                 eax

        $sequence_3 = { fc b7d0 4300da 5f c043bf72 96 }
            // n = 6, score = 200
            //   fc                   | adc                 bh, dl
            //   b7d0                 | dec                 eax
            //   4300da               | add                 esp, 0x60
            //   5f                   | dec                 eax
            //   c043bf72             | xchg                edi, edi
            //   96                   | xor                 bp, 0x7c22

        $sequence_4 = { f5 f6c2f4 56 40c0c653 312c24 410fbff5 0fb7f0 }
            // n = 7, score = 200
            //   f5                   | cmp                 dh, 0xba
            //   f6c2f4               | sub                 edx, edx
            //   56                   | inc                 bp
            //   40c0c653             | xor                 eax, eax
            //   312c24               | dec                 esp
            //   410fbff5             | movsx               ecx, bx
            //   0fb7f0               | dec                 ecx

        $sequence_5 = { e8???????? 85ed e9???????? 0f8486000000 8b44242c b236 d2e9 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   85ed                 | add                 dword ptr [esp + 0x18], 0xffef36f0
            //   e9????????           |                     
            //   0f8486000000         | dec                 esp
            //   8b44242c             | add                 dword ptr [esp], ebx
            //   b236                 | pop                 ebx
            //   d2e9                 | dec                 eax

        $sequence_6 = { f6942418000000 415e 57 48c7442418795c83a8 68f7132a31 49beba399b6e8c7dd46f 48bf7c1da6707d4a4023 }
            // n = 7, score = 200
            //   f6942418000000       | dec                 esp
            //   415e                 | sub                 eax, ecx
            //   57                   | dec                 ecx
            //   48c7442418795c83a8     | movsx    esi, cx
            //   68f7132a31           | movsx               si, cl
            //   49beba399b6e8c7dd46f     | dec    ecx
            //   48bf7c1da6707d4a4023     | mov    esp, eax

        $sequence_7 = { 4963d2 490fbfd0 4c8d442470 490fb7d3 4963cc 498d4d10 }
            // n = 6, score = 200
            //   4963d2               | dec                 eax
            //   490fbfd0             | mov                 dword ptr [esp + 8], ebx
            //   4c8d442470           | inc                 ecx
            //   490fb7d3             | mov                 esi, eax
            //   4963cc               | inc                 ebp
            //   498d4d10             | xor                 ebx, dword ptr [edi + eax*4]

        $sequence_8 = { 41b928000000 0fbfca f6d1 480fb7ca 488bcf e9???????? c744242004000000 }
            // n = 7, score = 200
            //   41b928000000         | inc                 ecx
            //   0fbfca               | cmp                 ebx, edi
            //   f6d1                 | je                  0x820
            //   480fb7ca             | dec                 eax
            //   488bcf               | mov                 edx, dword ptr [edi + 0x20]
            //   e9????????           |                     
            //   c744242004000000     | inc                 ecx

        $sequence_9 = { e8???????? 448b07 8b5704 8b4f08 9f 48f7d8 8b470c }
            // n = 7, score = 200
            //   e8????????           |                     
            //   448b07               | mov                 eax, edi
            //   8b5704               | dec                 eax
            //   8b4f08               | mov                 edi, dword ptr [esp + 0x40]
            //   9f                   | dec                 eax
            //   48f7d8               | shr                 eax, 8
            //   8b470c               | and                 edx, 0xff0000

    condition:
        7 of them and filesize < 3702784
}