rule win_spybot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.spybot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spybot"
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
        $sequence_0 = { 83c40c 8bf0 57 53 57 53 }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8bf0                 | mov                 esi, eax
            //   57                   | push                edi
            //   53                   | push                ebx
            //   57                   | push                edi
            //   53                   | push                ebx

        $sequence_1 = { 0f84da2a0000 ff7520 e8???????? 57 8bf0 e8???????? ff7510 }
            // n = 7, score = 100
            //   0f84da2a0000         | je                  0x2ae0
            //   ff7520               | push                dword ptr [ebp + 0x20]
            //   e8????????           |                     
            //   57                   | push                edi
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_2 = { 53 ff15???????? 8b8ddcfcffff 69c934020000 3bc3 89818c814400 7412 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b8ddcfcffff         | mov                 ecx, dword ptr [ebp - 0x324]
            //   69c934020000         | imul                ecx, ecx, 0x234
            //   3bc3                 | cmp                 eax, ebx
            //   89818c814400         | mov                 dword ptr [ecx + 0x44818c], eax
            //   7412                 | je                  0x14

        $sequence_3 = { 50 e8???????? 83c41c 85c0 0f85b8010000 391d???????? be???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   85c0                 | test                eax, eax
            //   0f85b8010000         | jne                 0x1be
            //   391d????????         |                     
            //   be????????           |                     

        $sequence_4 = { 75f6 3ac3 0f84f5b4ffff 895520 }
            // n = 4, score = 100
            //   75f6                 | jne                 0xfffffff8
            //   3ac3                 | cmp                 al, bl
            //   0f84f5b4ffff         | je                  0xffffb4fb
            //   895520               | mov                 dword ptr [ebp + 0x20], edx

        $sequence_5 = { 59 85f6 59 7414 57 6a01 8d441eff }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   85f6                 | test                esi, esi
            //   59                   | pop                 ecx
            //   7414                 | je                  0x16
            //   57                   | push                edi
            //   6a01                 | push                1
            //   8d441eff             | lea                 eax, [esi + ebx - 1]

        $sequence_6 = { 681f000200 57 68???????? 56 ff15???????? 85c0 7553 }
            // n = 7, score = 100
            //   681f000200           | push                0x2001f
            //   57                   | push                edi
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7553                 | jne                 0x55

        $sequence_7 = { e8???????? e9???????? 68???????? ebe3 395df8 751a 53 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   68????????           |                     
            //   ebe3                 | jmp                 0xffffffe5
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx
            //   751a                 | jne                 0x1c
            //   53                   | push                ebx

        $sequence_8 = { 740f 56 e8???????? 59 89858cfaffff eb06 }
            // n = 6, score = 100
            //   740f                 | je                  0x11
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   89858cfaffff         | mov                 dword ptr [ebp - 0x574], eax
            //   eb06                 | jmp                 8

        $sequence_9 = { 59 85c0 59 752b 6a57 58 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   752b                 | jne                 0x2d
            //   6a57                 | push                0x57
            //   58                   | pop                 eax

    condition:
        7 of them and filesize < 2367488
}