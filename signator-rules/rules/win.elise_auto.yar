rule win_elise_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.elise."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.elise"
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
        $sequence_0 = { 53 33c9 33db 663b4e06 731a }
            // n = 5, score = 400
            //   53                   | push                ebx
            //   33c9                 | xor                 ecx, ecx
            //   33db                 | xor                 ebx, ebx
            //   663b4e06             | cmp                 cx, word ptr [esi + 6]
            //   731a                 | jae                 0x1c

        $sequence_1 = { e8???????? 8b4df8 8d1c58 d3e0 0945f4 ff45f8 3975f8 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8d1c58               | lea                 ebx, [eax + ebx*2]
            //   d3e0                 | shl                 eax, cl
            //   0945f4               | or                  dword ptr [ebp - 0xc], eax
            //   ff45f8               | inc                 dword ptr [ebp - 8]
            //   3975f8               | cmp                 dword ptr [ebp - 8], esi

        $sequence_2 = { 8bcf e8???????? 8bcb 8d3470 }
            // n = 4, score = 400
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   8d3470               | lea                 esi, [eax + esi*2]

        $sequence_3 = { 7cf5 33c9 888f00010000 888f01010000 }
            // n = 4, score = 400
            //   7cf5                 | jl                  0xfffffff7
            //   33c9                 | xor                 ecx, ecx
            //   888f00010000         | mov                 byte ptr [edi + 0x100], cl
            //   888f01010000         | mov                 byte ptr [edi + 0x101], cl

        $sequence_4 = { 8b7e4c 8bda 66891c4f 41 }
            // n = 4, score = 400
            //   8b7e4c               | mov                 edi, dword ptr [esi + 0x4c]
            //   8bda                 | mov                 ebx, edx
            //   66891c4f             | mov                 word ptr [edi + ecx*2], bx
            //   41                   | inc                 ecx

        $sequence_5 = { 7406 57 6a01 51 }
            // n = 4, score = 400
            //   7406                 | je                  8
            //   57                   | push                edi
            //   6a01                 | push                1
            //   51                   | push                ecx

        $sequence_6 = { 888f00010000 888f01010000 8bf7 8945f8 }
            // n = 4, score = 400
            //   888f00010000         | mov                 byte ptr [edi + 0x100], cl
            //   888f01010000         | mov                 byte ptr [edi + 0x101], cl
            //   8bf7                 | mov                 esi, edi
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_7 = { 8b5018 881c11 83402001 5e 5b 83502400 }
            // n = 6, score = 400
            //   8b5018               | mov                 edx, dword ptr [eax + 0x18]
            //   881c11               | mov                 byte ptr [ecx + edx], bl
            //   83402001             | add                 dword ptr [eax + 0x20], 1
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   83502400             | adc                 dword ptr [eax + 0x24], 0

        $sequence_8 = { 0bc3 59 8dbe56030000 f3ab 8bc2 0fb7e8 }
            // n = 6, score = 400
            //   0bc3                 | or                  eax, ebx
            //   59                   | pop                 ecx
            //   8dbe56030000         | lea                 edi, [esi + 0x356]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8bc2                 | mov                 eax, edx
            //   0fb7e8               | movzx               ebp, ax

        $sequence_9 = { e8???????? 85c0 756f 83ff07 1bc0 83e0fe }
            // n = 6, score = 400
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   756f                 | jne                 0x71
            //   83ff07               | cmp                 edi, 7
            //   1bc0                 | sbb                 eax, eax
            //   83e0fe               | and                 eax, 0xfffffffe

        $sequence_10 = { 0f8e93000000 53 56 57 0fb6f1 }
            // n = 5, score = 300
            //   0f8e93000000         | jle                 0x99
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   0fb6f1               | movzx               esi, cl

        $sequence_11 = { 0bd6 40 83f80e 72e7 33c9 6a08 8bc1 }
            // n = 7, score = 300
            //   0bd6                 | or                  edx, esi
            //   40                   | inc                 eax
            //   83f80e               | cmp                 eax, 0xe
            //   72e7                 | jb                  0xffffffe9
            //   33c9                 | xor                 ecx, ecx
            //   6a08                 | push                8
            //   8bc1                 | mov                 eax, ecx

        $sequence_12 = { e8???????? 8bd8 8955ec 4e 79ce 837df400 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   4e                   | dec                 esi
            //   79ce                 | jns                 0xffffffd0
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0

        $sequence_13 = { 41 0fb6f1 8a1406 8855ff 0fb6d2 03d7 }
            // n = 6, score = 300
            //   41                   | inc                 ecx
            //   0fb6f1               | movzx               esi, cl
            //   8a1406               | mov                 dl, byte ptr [esi + eax]
            //   8855ff               | mov                 byte ptr [ebp - 1], dl
            //   0fb6d2               | movzx               edx, dl
            //   03d7                 | add                 edx, edi

        $sequence_14 = { 0fb6fa 8a1c07 881c06 8a5dff 881c07 8b5df8 }
            // n = 6, score = 300
            //   0fb6fa               | movzx               edi, dl
            //   8a1c07               | mov                 bl, byte ptr [edi + eax]
            //   881c06               | mov                 byte ptr [esi + eax], bl
            //   8a5dff               | mov                 bl, byte ptr [ebp - 1]
            //   881c07               | mov                 byte ptr [edi + eax], bl
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]

        $sequence_15 = { 6a08 8bc1 5e a801 7406 d1e8 33c2 }
            // n = 7, score = 300
            //   6a08                 | push                8
            //   8bc1                 | mov                 eax, ecx
            //   5e                   | pop                 esi
            //   a801                 | test                al, 1
            //   7406                 | je                  8
            //   d1e8                 | shr                 eax, 1
            //   33c2                 | xor                 eax, edx

    condition:
        7 of them and filesize < 204800
}