rule win_thumbthief_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.thumbthief."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.thumbthief"
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
        $sequence_0 = { e8???????? eb05 e8???????? 83c404 c745fc00000000 f6c301 742e }
            // n = 7, score = 100
            //   e8????????           |                     
            //   eb05                 | jmp                 7
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   f6c301               | test                bl, 1
            //   742e                 | je                  0x30

        $sequence_1 = { e8???????? 8d45e8 50 e8???????? 8b45f0 33f6 894508 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   33f6                 | xor                 esi, esi
            //   894508               | mov                 dword ptr [ebp + 8], eax

        $sequence_2 = { 8d742470 3c02 741f f20f58ca 660f2fcd f20f114c2448 720f }
            // n = 7, score = 100
            //   8d742470             | lea                 esi, [esp + 0x70]
            //   3c02                 | cmp                 al, 2
            //   741f                 | je                  0x21
            //   f20f58ca             | addsd               xmm1, xmm2
            //   660f2fcd             | comisd              xmm1, xmm5
            //   f20f114c2448         | movsd               qword ptr [esp + 0x48], xmm1
            //   720f                 | jb                  0x11

        $sequence_3 = { e8???????? ff75e4 8bce e8???????? c645fc0b c745e804645800 c645fc0b }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   c645fc0b             | mov                 byte ptr [ebp - 4], 0xb
            //   c745e804645800       | mov                 dword ptr [ebp - 0x18], 0x586404
            //   c645fc0b             | mov                 byte ptr [ebp - 4], 0xb

        $sequence_4 = { e8???????? 8bf8 83c410 85ff 7516 ff7650 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c410               | add                 esp, 0x10
            //   85ff                 | test                edi, edi
            //   7516                 | jne                 0x18
            //   ff7650               | push                dword ptr [esi + 0x50]
            //   e8????????           |                     

        $sequence_5 = { e8???????? c645fc07 8d8ddcfeffff e8???????? c645fc06 8d8d04ffffff e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc07             | mov                 byte ptr [ebp - 4], 7
            //   8d8ddcfeffff         | lea                 ecx, [ebp - 0x124]
            //   e8????????           |                     
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6
            //   8d8d04ffffff         | lea                 ecx, [ebp - 0xfc]
            //   e8????????           |                     

        $sequence_6 = { eb05 68???????? 8d4d84 e8???????? 68???????? 8d4584 50 }
            // n = 7, score = 100
            //   eb05                 | jmp                 7
            //   68????????           |                     
            //   8d4d84               | lea                 ecx, [ebp - 0x7c]
            //   e8????????           |                     
            //   68????????           |                     
            //   8d4584               | lea                 eax, [ebp - 0x7c]
            //   50                   | push                eax

        $sequence_7 = { 8da42400000000 8b8e18010000 8b7908 81ff1d002003 7238 8b01 8bce }
            // n = 7, score = 100
            //   8da42400000000       | lea                 esp, [esp]
            //   8b8e18010000         | mov                 ecx, dword ptr [esi + 0x118]
            //   8b7908               | mov                 edi, dword ptr [ecx + 8]
            //   81ff1d002003         | cmp                 edi, 0x320001d
            //   7238                 | jb                  0x3a
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8bce                 | mov                 ecx, esi

        $sequence_8 = { e8???????? 8b7508 85f6 7520 68???????? 68???????? 8d4d90 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   85f6                 | test                esi, esi
            //   7520                 | jne                 0x22
            //   68????????           |                     
            //   68????????           |                     
            //   8d4d90               | lea                 ecx, [ebp - 0x70]

        $sequence_9 = { ff7008 8bc8 e8???????? 8d8c24dc000000 e8???????? 6a14 6a41 }
            // n = 7, score = 100
            //   ff7008               | push                dword ptr [eax + 8]
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8d8c24dc000000       | lea                 ecx, [esp + 0xdc]
            //   e8????????           |                     
            //   6a14                 | push                0x14
            //   6a41                 | push                0x41

    condition:
        7 of them and filesize < 4235264
}