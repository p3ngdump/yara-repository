rule win_trochilus_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.trochilus_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.trochilus_rat"
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
        $sequence_0 = { eb05 68???????? 8d8dbcf7ffff e8???????? 83bd98f7ffff08 8b8d84f7ffff 7306 }
            // n = 7, score = 100
            //   eb05                 | jmp                 7
            //   68????????           |                     
            //   8d8dbcf7ffff         | lea                 ecx, [ebp - 0x844]
            //   e8????????           |                     
            //   83bd98f7ffff08       | cmp                 dword ptr [ebp - 0x868], 8
            //   8b8d84f7ffff         | mov                 ecx, dword ptr [ebp - 0x87c]
            //   7306                 | jae                 8

        $sequence_1 = { eb4d 83c2dc 83fa09 7745 ff249574157e00 c700???????? eb36 }
            // n = 7, score = 100
            //   eb4d                 | jmp                 0x4f
            //   83c2dc               | add                 edx, -0x24
            //   83fa09               | cmp                 edx, 9
            //   7745                 | ja                  0x47
            //   ff249574157e00       | jmp                 dword ptr [edx*4 + 0x7e1574]
            //   c700????????         |                     
            //   eb36                 | jmp                 0x38

        $sequence_2 = { c745cc10db7f00 e8???????? 8b7508 bf63736de0 393e 0f85a5010000 837e1003 }
            // n = 7, score = 100
            //   c745cc10db7f00       | mov                 dword ptr [ebp - 0x34], 0x7fdb10
            //   e8????????           |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   bf63736de0           | mov                 edi, 0xe06d7363
            //   393e                 | cmp                 dword ptr [esi], edi
            //   0f85a5010000         | jne                 0x1ab
            //   837e1003             | cmp                 dword ptr [esi + 0x10], 3

        $sequence_3 = { e8???????? 83c414 eb70 57 ff15???????? 85c0 7522 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   eb70                 | jmp                 0x72
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24

        $sequence_4 = { 8d5104 8bf0 2bf2 f7de 1bf6 23f0 7418 }
            // n = 7, score = 100
            //   8d5104               | lea                 edx, [ecx + 4]
            //   8bf0                 | mov                 esi, eax
            //   2bf2                 | sub                 esi, edx
            //   f7de                 | neg                 esi
            //   1bf6                 | sbb                 esi, esi
            //   23f0                 | and                 esi, eax
            //   7418                 | je                  0x1a

        $sequence_5 = { 894724 894f28 e8???????? 837b6c00 742e ff75f0 be8c1d0110 }
            // n = 7, score = 100
            //   894724               | mov                 dword ptr [edi + 0x24], eax
            //   894f28               | mov                 dword ptr [edi + 0x28], ecx
            //   e8????????           |                     
            //   837b6c00             | cmp                 dword ptr [ebx + 0x6c], 0
            //   742e                 | je                  0x30
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   be8c1d0110           | mov                 esi, 0x10011d8c

        $sequence_6 = { 0fb78600010100 50 ffd3 66894732 0fb78604010100 50 ffd3 }
            // n = 7, score = 100
            //   0fb78600010100       | movzx               eax, word ptr [esi + 0x10100]
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   66894732             | mov                 word ptr [edi + 0x32], ax
            //   0fb78604010100       | movzx               eax, word ptr [esi + 0x10104]
            //   50                   | push                eax
            //   ffd3                 | call                ebx

        $sequence_7 = { be8c1d0110 e8???????? 8b44241c e8???????? 85c0 7415 8b742414 }
            // n = 7, score = 100
            //   be8c1d0110           | mov                 esi, 0x10011d8c
            //   e8????????           |                     
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17
            //   8b742414             | mov                 esi, dword ptr [esp + 0x14]

        $sequence_8 = { 83f8ff 7504 6a0f eb06 33c0 }
            // n = 5, score = 100
            //   83f8ff               | cmp                 eax, -1
            //   7504                 | jne                 6
            //   6a0f                 | push                0xf
            //   eb06                 | jmp                 8
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 8b4850 8b490c 8b09 41 89483c 5d c20400 }
            // n = 7, score = 100
            //   8b4850               | mov                 ecx, dword ptr [eax + 0x50]
            //   8b490c               | mov                 ecx, dword ptr [ecx + 0xc]
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   41                   | inc                 ecx
            //   89483c               | mov                 dword ptr [eax + 0x3c], ecx
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4

    condition:
        7 of them and filesize < 630784
}