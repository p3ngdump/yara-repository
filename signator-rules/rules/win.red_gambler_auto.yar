rule win_red_gambler_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.red_gambler."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.red_gambler"
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
        $sequence_0 = { 751a 8b3d???????? 6a0a ffd7 68???????? ffd6 a3???????? }
            // n = 7, score = 400
            //   751a                 | jne                 0x1c
            //   8b3d????????         |                     
            //   6a0a                 | push                0xa
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   a3????????           |                     

        $sequence_1 = { 8bf0 81ff00000100 7cbe 8b7d0c 85ff 7e59 8b5d08 }
            // n = 7, score = 400
            //   8bf0                 | mov                 esi, eax
            //   81ff00000100         | cmp                 edi, 0x10000
            //   7cbe                 | jl                  0xffffffc0
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   85ff                 | test                edi, edi
            //   7e59                 | jle                 0x5b
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]

        $sequence_2 = { 8a08 80f9a2 7529 807801c3 7523 }
            // n = 5, score = 400
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   80f9a2               | cmp                 cl, 0xa2
            //   7529                 | jne                 0x2b
            //   807801c3             | cmp                 byte ptr [eax + 1], 0xc3
            //   7523                 | jne                 0x25

        $sequence_3 = { 8db0ac7b0300 8b06 8945ec 3b45f4 7556 }
            // n = 5, score = 400
            //   8db0ac7b0300         | lea                 esi, [eax + 0x37bac]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   3b45f4               | cmp                 eax, dword ptr [ebp - 0xc]
            //   7556                 | jne                 0x58

        $sequence_4 = { e8???????? 83c40c 68???????? 68???????? ffd6 8b0d???????? }
            // n = 6, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   8b0d????????         |                     

        $sequence_5 = { 68???????? ffd6 6800010000 57 68???????? e8???????? 83c40c }
            // n = 7, score = 400
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   6800010000           | push                0x100
            //   57                   | push                edi
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_6 = { ffd3 85c0 741e 33c0 57 8906 }
            // n = 6, score = 400
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20
            //   33c0                 | xor                 eax, eax
            //   57                   | push                edi
            //   8906                 | mov                 dword ptr [esi], eax

        $sequence_7 = { 7537 8d95fcfbffff 52 ffd7 8db405fdfbffff 6800010000 56 }
            // n = 7, score = 400
            //   7537                 | jne                 0x39
            //   8d95fcfbffff         | lea                 edx, [ebp - 0x404]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   8db405fdfbffff       | lea                 esi, [ebp + eax - 0x403]
            //   6800010000           | push                0x100
            //   56                   | push                esi

        $sequence_8 = { 52 ff15???????? 8d8594fbffff 50 }
            // n = 4, score = 300
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8d8594fbffff         | lea                 eax, [ebp - 0x46c]
            //   50                   | push                eax

        $sequence_9 = { e8???????? 842a 06 7f6f }
            // n = 4, score = 300
            //   e8????????           |                     
            //   842a                 | test                byte ptr [edx], ch
            //   06                   | push                es
            //   7f6f                 | jg                  0x71

        $sequence_10 = { 5c 58 9e e779 9e 54 }
            // n = 6, score = 300
            //   5c                   | pop                 esp
            //   58                   | pop                 eax
            //   9e                   | sahf                
            //   e779                 | out                 0x79, eax
            //   9e                   | sahf                
            //   54                   | push                esp

        $sequence_11 = { 4f 8d74c79e cf 23530e 861e 6589814b41c34a }
            // n = 6, score = 300
            //   4f                   | dec                 edi
            //   8d74c79e             | lea                 esi, [edi + eax*8 - 0x62]
            //   cf                   | iretd               
            //   23530e               | and                 edx, dword ptr [ebx + 0xe]
            //   861e                 | xchg                byte ptr [esi], bl
            //   6589814b41c34a       | mov                 dword ptr gs:[ecx + 0x4ac3414b], eax

        $sequence_12 = { 7061 2dc7dc1667 3663ea 7c0e 07 642827 }
            // n = 6, score = 300
            //   7061                 | jo                  0x63
            //   2dc7dc1667           | sub                 eax, 0x6716dcc7
            //   3663ea               | arpl                dx, bp
            //   7c0e                 | jl                  0x10
            //   07                   | pop                 es
            //   642827               | sub                 byte ptr fs:[edi], ah

        $sequence_13 = { 68???????? 8d8d98fbffff 68???????? 51 ff15???????? 83c414 }
            // n = 6, score = 300
            //   68????????           |                     
            //   8d8d98fbffff         | lea                 ecx, [ebp - 0x468]
            //   68????????           |                     
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14

        $sequence_14 = { 2b2a bee7eee947 7c26 0e }
            // n = 4, score = 300
            //   2b2a                 | sub                 ebp, dword ptr [edx]
            //   bee7eee947           | mov                 esi, 0x47e9eee7
            //   7c26                 | jl                  0x28
            //   0e                   | push                cs

        $sequence_15 = { 51 ff15???????? 8d5598 52 8d8598fdffff }
            // n = 5, score = 300
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8d5598               | lea                 edx, [ebp - 0x68]
            //   52                   | push                edx
            //   8d8598fdffff         | lea                 eax, [ebp - 0x268]

        $sequence_16 = { 42 e5e1 5f b476 }
            // n = 4, score = 300
            //   42                   | inc                 edx
            //   e5e1                 | in                  eax, 0xe1
            //   5f                   | pop                 edi
            //   b476                 | mov                 ah, 0x76

        $sequence_17 = { 6800010000 8d8dfcfdffff 51 6a00 }
            // n = 4, score = 300
            //   6800010000           | push                0x100
            //   8d8dfcfdffff         | lea                 ecx, [ebp - 0x204]
            //   51                   | push                ecx
            //   6a00                 | push                0

        $sequence_18 = { ff15???????? 83c414 6a00 6a00 8d9598fbffff 52 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d9598fbffff         | lea                 edx, [ebp - 0x468]
            //   52                   | push                edx

        $sequence_19 = { 6800010000 8d85fcfeffff 50 6a00 ff15???????? }
            // n = 5, score = 300
            //   6800010000           | push                0x100
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_20 = { 52 8d8598fdffff 50 68???????? 8d8d98fbffff 68???????? }
            // n = 6, score = 300
            //   52                   | push                edx
            //   8d8598fdffff         | lea                 eax, [ebp - 0x268]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d8d98fbffff         | lea                 ecx, [ebp - 0x468]
            //   68????????           |                     

        $sequence_21 = { e779 9e e768 6460 5c }
            // n = 5, score = 300
            //   e779                 | out                 0x79, eax
            //   9e                   | sahf                
            //   e768                 | out                 0x68, eax
            //   6460                 | pushal              
            //   5c                   | pop                 esp

        $sequence_22 = { 48 44 40 6c 9e e779 3428 }
            // n = 7, score = 300
            //   48                   | dec                 eax
            //   44                   | inc                 esp
            //   40                   | inc                 eax
            //   6c                   | insb                byte ptr es:[edi], dx
            //   9e                   | sahf                
            //   e779                 | out                 0x79, eax
            // 

        $sequence_23 = { 8d8d98fdffff 51 8d9598feffff 52 }
            // n = 4, score = 300
            //   8d8d98fdffff         | lea                 ecx, [ebp - 0x268]
            //   51                   | push                ecx
            //   8d9598feffff         | lea                 edx, [ebp - 0x168]
            //   52                   | push                edx

        $sequence_24 = { 52 68???????? 6a00 6a00 ff15???????? 8b4dfc 33cd }
            // n = 7, score = 300
            //   52                   | push                edx
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

        $sequence_25 = { 7229 f3a5 ff249530454000 8bc7 ba03000000 }
            // n = 5, score = 100
            //   7229                 | jb                  0x2b
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff249530454000       | jmp                 dword ptr [edx*4 + 0x404530]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3

        $sequence_26 = { 51 8d95fcfeffff 52 ff15???????? 40 68???????? 50 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   8d95fcfeffff         | lea                 edx, [ebp - 0x104]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   40                   | inc                 eax
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_27 = { 8d34c5d0814000 833e00 7513 50 e8???????? 59 85c0 }
            // n = 7, score = 100
            //   8d34c5d0814000       | lea                 esi, [eax*8 + 0x4081d0]
            //   833e00               | cmp                 dword ptr [esi], 0
            //   7513                 | jne                 0x15
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_28 = { 50 e8???????? 83c414 c3 6a08 68???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   c3                   | ret                 
            //   6a08                 | push                8
            //   68????????           |                     

        $sequence_29 = { ff15???????? 8bf0 85f6 0f856effffff }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   0f856effffff         | jne                 0xffffff74

        $sequence_30 = { 44 40 0023 d18a0688078a 46 }
            // n = 5, score = 100
            //   44                   | inc                 esp
            //   40                   | inc                 eax
            //   0023                 | add                 byte ptr [ebx], ah
            //   d18a0688078a         | ror                 dword ptr [edx - 0x75f877fa], 1
            //   46                   | inc                 esi

        $sequence_31 = { 85c0 7524 a1???????? a3???????? a1???????? c705????????6b214000 8935???????? }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7524                 | jne                 0x26
            //   a1????????           |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   c705????????6b214000     |     
            //   8935????????         |                     

    condition:
        7 of them and filesize < 327680
}