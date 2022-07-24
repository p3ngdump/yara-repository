rule win_credraptor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.credraptor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.credraptor"
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
        $sequence_0 = { 8b4dc8 8b55a4 885803 894804 895008 89580c 895810 }
            // n = 7, score = 100
            //   8b4dc8               | mov                 ecx, dword ptr [ebp - 0x38]
            //   8b55a4               | mov                 edx, dword ptr [ebp - 0x5c]
            //   885803               | mov                 byte ptr [eax + 3], bl
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   895008               | mov                 dword ptr [eax + 8], edx
            //   89580c               | mov                 dword ptr [eax + 0xc], ebx
            //   895810               | mov                 dword ptr [eax + 0x10], ebx

        $sequence_1 = { e8???????? 83c40c e9???????? 837f3000 7415 8b5508 52 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   e9????????           |                     
            //   837f3000             | cmp                 dword ptr [edi + 0x30], 0
            //   7415                 | je                  0x17
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx

        $sequence_2 = { ebaa 8b4508 80485002 89481c 0fbf4854 895018 6689744856 }
            // n = 7, score = 100
            //   ebaa                 | jmp                 0xffffffac
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   80485002             | or                  byte ptr [eax + 0x50], 2
            //   89481c               | mov                 dword ptr [eax + 0x1c], ecx
            //   0fbf4854             | movsx               ecx, word ptr [eax + 0x54]
            //   895018               | mov                 dword ptr [eax + 0x18], edx
            //   6689744856           | mov                 word ptr [eax + ecx*2 + 0x56], si

        $sequence_3 = { 85c0 7406 c6462801 eb17 837d1400 7511 b900020000 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8
            //   c6462801             | mov                 byte ptr [esi + 0x28], 1
            //   eb17                 | jmp                 0x19
            //   837d1400             | cmp                 dword ptr [ebp + 0x14], 0
            //   7511                 | jne                 0x13
            //   b900020000           | mov                 ecx, 0x200

        $sequence_4 = { e8???????? 83c408 c6474000 be07000000 8b7f38 eb05 bfff000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   c6474000             | mov                 byte ptr [edi + 0x40], 0
            //   be07000000           | mov                 esi, 7
            //   8b7f38               | mov                 edi, dword ptr [edi + 0x38]
            //   eb05                 | jmp                 7
            //   bfff000000           | mov                 edi, 0xff

        $sequence_5 = { f7f3 8b45fc 8d04d0 85c0 7435 8b30 85f6 }
            // n = 7, score = 100
            //   f7f3                 | div                 ebx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8d04d0               | lea                 eax, [eax + edx*8]
            //   85c0                 | test                eax, eax
            //   7435                 | je                  0x37
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   85f6                 | test                esi, esi

        $sequence_6 = { c6471701 8b7f44 4f 8bc3 897df4 e8???????? 837d2400 }
            // n = 7, score = 100
            //   c6471701             | mov                 byte ptr [edi + 0x17], 1
            //   8b7f44               | mov                 edi, dword ptr [edi + 0x44]
            //   4f                   | dec                 edi
            //   8bc3                 | mov                 eax, ebx
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi
            //   e8????????           |                     
            //   837d2400             | cmp                 dword ptr [ebp + 0x24], 0

        $sequence_7 = { c7452400000000 8b4ddc 8b510c 807a4c04 1bc0 f7d8 48 }
            // n = 7, score = 100
            //   c7452400000000       | mov                 dword ptr [ebp + 0x24], 0
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]
            //   807a4c04             | cmp                 byte ptr [edx + 0x4c], 4
            //   1bc0                 | sbb                 eax, eax
            //   f7d8                 | neg                 eax
            //   48                   | dec                 eax

        $sequence_8 = { ff15???????? 83c404 8bc7 5f 8bd3 5b 5e }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   8bd3                 | mov                 edx, ebx
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi

        $sequence_9 = { eb49 8b4df0 8b4108 8b5104 894844 83fe01 0f95c1 }
            // n = 7, score = 100
            //   eb49                 | jmp                 0x4b
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   8b4108               | mov                 eax, dword ptr [ecx + 8]
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   894844               | mov                 dword ptr [eax + 0x44], ecx
            //   83fe01               | cmp                 esi, 1
            //   0f95c1               | setne               cl

    condition:
        7 of them and filesize < 1728512
}