rule win_bravonc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bravonc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bravonc"
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
        $sequence_0 = { 33db 33f6 e8???????? 85c0 59 7618 0fbe043e }
            // n = 7, score = 100
            //   33db                 | xor                 ebx, ebx
            //   33f6                 | xor                 esi, esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   7618                 | jbe                 0x1a
            //   0fbe043e             | movsx               eax, byte ptr [esi + edi]

        $sequence_1 = { 8b4df8 8b96c0000000 334dec 57 ff75fc 334dfc 034a2c }
            // n = 7, score = 100
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8b96c0000000         | mov                 edx, dword ptr [esi + 0xc0]
            //   334dec               | xor                 ecx, dword ptr [ebp - 0x14]
            //   57                   | push                edi
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   334dfc               | xor                 ecx, dword ptr [ebp - 4]
            //   034a2c               | add                 ecx, dword ptr [edx + 0x2c]

        $sequence_2 = { 57 8bce e8???????? 8b06 8d4dfc 51 8d8d04feffff }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d4dfc               | lea                 ecx, [ebp - 4]
            //   51                   | push                ecx
            //   8d8d04feffff         | lea                 ecx, [ebp - 0x1fc]

        $sequence_3 = { 8945ec e8???????? 8945f4 8b86c0000000 6a01 8b4838 334820 }
            // n = 7, score = 100
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b86c0000000         | mov                 eax, dword ptr [esi + 0xc0]
            //   6a01                 | push                1
            //   8b4838               | mov                 ecx, dword ptr [eax + 0x38]
            //   334820               | xor                 ecx, dword ptr [eax + 0x20]

        $sequence_4 = { 894110 e8???????? 8b4dec 57 334dfc ff75f0 }
            // n = 6, score = 100
            //   894110               | mov                 dword ptr [ecx + 0x10], eax
            //   e8????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   57                   | push                edi
            //   334dfc               | xor                 ecx, dword ptr [ebp - 4]
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_5 = { 334df0 03c1 8b8ec0000000 034110 8b4df8 8d8401a1ebd96e 8945f8 }
            // n = 7, score = 100
            //   334df0               | xor                 ecx, dword ptr [ebp - 0x10]
            //   03c1                 | add                 eax, ecx
            //   8b8ec0000000         | mov                 ecx, dword ptr [esi + 0xc0]
            //   034110               | add                 eax, dword ptr [ecx + 0x10]
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8d8401a1ebd96e       | lea                 eax, [ecx + eax + 0x6ed9eba1]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_6 = { 895834 e8???????? 8b4df4 83c440 334df0 57 234df8 }
            // n = 7, score = 100
            //   895834               | mov                 dword ptr [eax + 0x34], ebx
            //   e8????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   83c440               | add                 esp, 0x40
            //   334df0               | xor                 ecx, dword ptr [ebp - 0x10]
            //   57                   | push                edi
            //   234df8               | and                 ecx, dword ptr [ebp - 8]

        $sequence_7 = { ff7508 e8???????? 83c40c 017e0c 5f 5e c9 }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   017e0c               | add                 dword ptr [esi + 0xc], edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c9                   | leave               

        $sequence_8 = { 334dfc 57 ff75f4 334df0 }
            // n = 4, score = 100
            //   334dfc               | xor                 ecx, dword ptr [ebp - 4]
            //   57                   | push                edi
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   334df0               | xor                 ecx, dword ptr [ebp - 0x10]

        $sequence_9 = { 8d4dc8 c645fc01 8845c8 ff15???????? 8065ef00 8d85a4feffff 50 }
            // n = 7, score = 100
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8845c8               | mov                 byte ptr [ebp - 0x38], al
            //   ff15????????         |                     
            //   8065ef00             | and                 byte ptr [ebp - 0x11], 0
            //   8d85a4feffff         | lea                 eax, [ebp - 0x15c]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 131072
}