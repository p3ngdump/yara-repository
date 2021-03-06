rule win_fickerstealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.fickerstealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fickerstealer"
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
        $sequence_0 = { 8d4da4 f20f114b08 f20f1103 8d5de4 89da e8???????? f20f104750 }
            // n = 7, score = 200
            //   8d4da4               | lea                 ecx, [ebp - 0x5c]
            //   f20f114b08           | movsd               qword ptr [ebx + 8], xmm1
            //   f20f1103             | movsd               qword ptr [ebx], xmm0
            //   8d5de4               | lea                 ebx, [ebp - 0x1c]
            //   89da                 | mov                 edx, ebx
            //   e8????????           |                     
            //   f20f104750           | movsd               xmm0, qword ptr [edi + 0x50]

        $sequence_1 = { e8???????? 59 89f1 83fa04 0fc9 898dd4feffff 0f85f0250000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   89f1                 | mov                 ecx, esi
            //   83fa04               | cmp                 edx, 4
            //   0fc9                 | bswap               ecx
            //   898dd4feffff         | mov                 dword ptr [ebp - 0x12c], ecx
            //   0f85f0250000         | jne                 0x25f6

        $sequence_2 = { f20f118c1198000000 f20f11841190000000 66894106 8b4c2414 8b5c2478 8b442418 f6d1 }
            // n = 7, score = 200
            //   f20f118c1198000000     | movsd    qword ptr [ecx + edx + 0x98], xmm1
            //   f20f11841190000000     | movsd    qword ptr [ecx + edx + 0x90], xmm0
            //   66894106             | mov                 word ptr [ecx + 6], ax
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8b5c2478             | mov                 ebx, dword ptr [esp + 0x78]
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   f6d1                 | not                 cl

        $sequence_3 = { e8???????? 59 5d c3 55 89e5 53 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   53                   | push                ebx

        $sequence_4 = { eb78 8d7c2410 89f9 e8???????? 8b5708 8b0f 89d3 }
            // n = 7, score = 200
            //   eb78                 | jmp                 0x7a
            //   8d7c2410             | lea                 edi, [esp + 0x10]
            //   89f9                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8b5708               | mov                 edx, dword ptr [edi + 8]
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   89d3                 | mov                 ebx, edx

        $sequence_5 = { 8d4ddc f20f1045a0 f20f104d98 f20f114208 f20f110a 50 e8???????? }
            // n = 7, score = 200
            //   8d4ddc               | lea                 ecx, [ebp - 0x24]
            //   f20f1045a0           | movsd               xmm0, qword ptr [ebp - 0x60]
            //   f20f104d98           | movsd               xmm1, qword ptr [ebp - 0x68]
            //   f20f114208           | movsd               qword ptr [edx + 8], xmm0
            //   f20f110a             | movsd               qword ptr [edx], xmm1
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_6 = { 8b8d60feffff 21c1 8b4584 898d24fdffff 8d8d54feffff 8985d4feffff 8b45bc }
            // n = 7, score = 200
            //   8b8d60feffff         | mov                 ecx, dword ptr [ebp - 0x1a0]
            //   21c1                 | and                 ecx, eax
            //   8b4584               | mov                 eax, dword ptr [ebp - 0x7c]
            //   898d24fdffff         | mov                 dword ptr [ebp - 0x2dc], ecx
            //   8d8d54feffff         | lea                 ecx, [ebp - 0x1ac]
            //   8985d4feffff         | mov                 dword ptr [ebp - 0x12c], eax
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]

        $sequence_7 = { b002 09f2 0f94c1 28c8 8d65f4 5e 5f }
            // n = 7, score = 200
            //   b002                 | mov                 al, 2
            //   09f2                 | or                  edx, esi
            //   0f94c1               | sete                cl
            //   28c8                 | sub                 al, cl
            //   8d65f4               | lea                 esp, [ebp - 0xc]
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_8 = { e8???????? 59 31c9 85c0 0f445508 0f94c1 0f45f8 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   31c9                 | xor                 ecx, ecx
            //   85c0                 | test                eax, eax
            //   0f445508             | cmove               edx, dword ptr [ebp + 8]
            //   0f94c1               | sete                cl
            //   0f45f8               | cmovne              edi, eax

        $sequence_9 = { c3 55 89e5 57 56 81ec80000000 8b750c }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   57                   | push                edi
            //   56                   | push                esi
            //   81ec80000000         | sub                 esp, 0x80
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 598016
}