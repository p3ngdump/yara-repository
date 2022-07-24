rule win_bankshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bankshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bankshot"
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
        $sequence_0 = { 8bf8 8d5101 8a01 41 84c0 75f9 57 }
            // n = 7, score = 300
            //   8bf8                 | mov                 edi, eax
            //   8d5101               | lea                 edx, [ecx + 1]
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   41                   | inc                 ecx
            //   84c0                 | test                al, al
            //   75f9                 | jne                 0xfffffffb
            //   57                   | push                edi

        $sequence_1 = { 81ec48040000 a1???????? 33c5 8945f8 53 }
            // n = 5, score = 300
            //   81ec48040000         | sub                 esp, 0x448
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   53                   | push                ebx

        $sequence_2 = { 8b45e0 8d4e0c 6a06 8d90c4e10110 5f }
            // n = 5, score = 200
            //   8b45e0               | mov                 eax, dword ptr [ebp + 8]
            //   8d4e0c               | add                 esp, 0xc
            //   6a06                 | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   8d90c4e10110         | mov                 dword ptr [ebp - 0x20], eax
            //   5f                   | lea                 eax, [eax + 0x1001e1d0]

        $sequence_3 = { 3bca 7cf3 33f6 83fa0c }
            // n = 4, score = 200
            //   3bca                 | add                 eax, 0x30
            //   7cf3                 | mov                 dword ptr [ebp - 0x1c], ecx
            //   33f6                 | mov                 edi, eax
            //   83fa0c               | lea                 edx, [ecx + 1]

        $sequence_4 = { c700???????? 8b4508 898850030000 8b4508 59 c74048b8e40110 }
            // n = 6, score = 200
            //   c700????????         |                     
            //   8b4508               | mov                 dword ptr [ebp - 0x1c], ecx
            //   898850030000         | mov                 eax, dword ptr [ebp + 8]
            //   8b4508               | pop                 ecx
            //   59                   | mov                 dword ptr [eax + 0x48], 0x1001e4b8
            //   c74048b8e40110       | mov                 eax, dword ptr [ebp + 8]

        $sequence_5 = { e8???????? 83c40c e8???????? 99 b907000000 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c40c               | push                0
            //   e8????????           |                     
            //   99                   | push                0xfde9
            //   b907000000           | call                ebx

        $sequence_6 = { 0fb6c0 eb17 81fa00010000 7313 8a87bce10110 08441619 42 }
            // n = 7, score = 200
            //   0fb6c0               | je                  0x48
            //   eb17                 | mov                 dword ptr [ebp - 0x20], eax
            //   81fa00010000         | lea                 eax, [eax + 0x1001e1d0]
            //   7313                 | mov                 dword ptr [ebp - 0x1c], eax
            //   8a87bce10110         | cmp                 byte ptr [eax], 0
            //   08441619             | mov                 ecx, eax
            //   42                   | mov                 dword ptr [eax + 0x350], ecx

        $sequence_7 = { c74048b8e40110 8b4508 6689486c 8b4508 66898872010000 8b4508 83a04c03000000 }
            // n = 7, score = 200
            //   c74048b8e40110       | mov                 dword ptr [eax + 0x48], 0x1001e4b8
            //   8b4508               | pop                 ecx
            //   6689486c             | mov                 dword ptr [eax + 0x48], 0x1001e4b8
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   66898872010000       | mov                 word ptr [eax + 0x6c], cx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83a04c03000000       | mov                 word ptr [eax + 0x172], cx

        $sequence_8 = { e8???????? 83c40c 6b45e430 8945e0 8d80d0e10110 8945e4 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c40c               | cmp                 edx, eax
            //   6b45e430             | mov                 dword ptr [eax + 0x350], ecx
            //   8945e0               | mov                 eax, dword ptr [ebp + 8]
            //   8d80d0e10110         | pop                 ecx
            //   8945e4               | mov                 dword ptr [eax + 0x48], 0x1001e4b8

        $sequence_9 = { 33c9 85d2 7e77 83fa20 7258 251f000080 7905 }
            // n = 7, score = 200
            //   33c9                 | cmp                 ecx, edx
            //   85d2                 | jl                  0xfffffff5
            //   7e77                 | xor                 esi, esi
            //   83fa20               | cmp                 edx, 0xc
            //   7258                 | sub                 esi, eax
            //   251f000080           | nop                 
            //   7905                 | movups              xmm0, xmmword ptr [ebp + ecx - 0xc01c]

        $sequence_10 = { 682c010000 50 6a14 8d8d00b9ffff e8???????? }
            // n = 5, score = 200
            //   682c010000           | mov                 dword ptr [ebp - 8], eax
            //   50                   | push                ebx
            //   6a14                 | push                ebp
            //   8d8d00b9ffff         | mov                 ebp, esp
            //   e8????????           |                     

        $sequence_11 = { 8d90c4e10110 5f 668b02 8d5202 }
            // n = 4, score = 200
            //   8d90c4e10110         | lea                 ecx, [esi + 0xc]
            //   5f                   | push                6
            //   668b02               | lea                 edx, [eax + 0x1001e1c4]
            //   8d5202               | add                 esp, 4

        $sequence_12 = { 8bc7 894de4 3998c0e10110 0f84ea000000 }
            // n = 4, score = 200
            //   8bc7                 | mov                 eax, dword ptr [ebp + 8]
            //   894de4               | mov                 word ptr [eax + 0x172], cx
            //   3998c0e10110         | mov                 eax, dword ptr [ebp + 8]
            //   0f84ea000000         | and                 dword ptr [eax + 0x34c], 0

        $sequence_13 = { 7e71 83fa20 7252 251f000080 }
            // n = 4, score = 200
            //   7e71                 | sub                 esp, 0x448
            //   83fa20               | xor                 eax, ebp
            //   7252                 | mov                 dword ptr [ebp - 8], eax
            //   251f000080           | push                ebx

        $sequence_14 = { 51 57 6a00 68e9fd0000 ffd3 8bd7 8985e4fbffff }
            // n = 7, score = 200
            //   51                   | mov                 ebp, esp
            //   57                   | sub                 esp, 0x448
            //   6a00                 | xor                 eax, ebp
            //   68e9fd0000           | mov                 dword ptr [ebp - 8], eax
            //   ffd3                 | push                ebx
            //   8bd7                 | sub                 esp, 0x448
            //   8985e4fbffff         | xor                 eax, ebp

        $sequence_15 = { 2bf0 90 0f10840de43fffff 0f28ca 660fefc8 }
            // n = 5, score = 200
            //   2bf0                 | mov                 al, byte ptr [ecx]
            //   90                   | inc                 ecx
            //   0f10840de43fffff     | test                al, al
            //   0f28ca               | jne                 3
            //   660fefc8             | push                edi

        $sequence_16 = { 8b45fc 817848b8e40110 7409 ff7048 e8???????? 59 c70701000000 }
            // n = 7, score = 200
            //   8b45fc               | inc                 ecx
            //   817848b8e40110       | mov                 eax, 0x104
            //   7409                 | dec                 eax
            //   ff7048               | lea                 edx, [esp + 0x44]
            //   e8????????           |                     
            //   59                   | dec                 ebp
            //   c70701000000         | mov                 ecx, ebp

        $sequence_17 = { ffd7 68???????? 53 8945bc ffd7 68???????? 53 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   53                   | push                ebx
            //   8945bc               | mov                 dword ptr [ebp - 0x44], eax
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   53                   | push                ebx

        $sequence_18 = { 488b05???????? 4833c4 488985a0030000 33f6 4c8bf9 4d8be8 }
            // n = 6, score = 100
            //   488b05????????       |                     
            //   4833c4               | dec                 eax
            //   488985a0030000       | mov                 ecx, ebx
            //   33f6                 | mov                 edx, dword ptr [ebx + 0x1afb0]
            //   4c8bf9               | dec                 eax
            //   4d8be8               | lea                 ecx, [0x7b38]

        $sequence_19 = { 8d831e0d0000 6a00 50 8945fc e8???????? }
            // n = 5, score = 100
            //   8d831e0d0000         | lea                 eax, [ebx + 0xd1e]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   e8????????           |                     

        $sequence_20 = { 85c0 0f848c000000 8b85d0fbffff 3d00040000 777f }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   0f848c000000         | je                  0x92
            //   8b85d0fbffff         | mov                 eax, dword ptr [ebp - 0x430]
            //   3d00040000           | cmp                 eax, 0x400
            //   777f                 | ja                  0x81

        $sequence_21 = { 488b442428 488b7c2438 4883c004 ffc6 4889442428 3bf3 0f8244ffffff }
            // n = 7, score = 100
            //   488b442428           | test                eax, eax
            //   488b7c2438           | je                  0x88
            //   4883c004             | dec                 eax
            //   ffc6                 | mov                 eax, dword ptr [esp + 0x28]
            //   4889442428           | dec                 eax
            //   3bf3                 | mov                 edi, dword ptr [esp + 0x38]
            //   0f8244ffffff         | dec                 eax

        $sequence_22 = { 68???????? 8d85a4f8ffff 50 e8???????? }
            // n = 4, score = 100
            //   68????????           |                     
            //   8d85a4f8ffff         | add                 esp, 0xc
            //   50                   | cdq                 
            //   e8????????           |                     

        $sequence_23 = { ff15???????? 85c0 751c 8b450c 8b0d???????? }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   85c0                 | add                 esp, 0xc
            //   751c                 | cdq                 
            //   8b450c               | mov                 ecx, 7
            //   8b0d????????         |                     

        $sequence_24 = { 83e03f 6bd030 895de4 8b049dc87f0110 }
            // n = 4, score = 100
            //   83e03f               | and                 eax, 0x3f
            //   6bd030               | imul                edx, eax, 0x30
            //   895de4               | mov                 dword ptr [ebp - 0x1c], ebx
            //   8b049dc87f0110       | mov                 eax, dword ptr [ebx*4 + 0x10017fc8]

        $sequence_25 = { ff15???????? 53 e8???????? 8b542424 8be8 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   53                   | mov                 ecx, 7
            //   e8????????           |                     
            //   8b542424             | add                 esp, 0xc
            //   8be8                 | cdq                 

        $sequence_26 = { 33d2 41b800040000 e8???????? 488d4c2450 33d2 41b804010000 }
            // n = 6, score = 100
            //   33d2                 | dec                 eax
            //   41b800040000         | lea                 edx, [ebx + 0x914]
            //   e8????????           |                     
            //   488d4c2450           | mov                 edx, 0x12345c
            //   33d2                 | dec                 ecx
            //   41b804010000         | mov                 ecx, ebp

        $sequence_27 = { 51 ff15???????? 8985f0feffff 83bdf0feffff00 0f8499000000 }
            // n = 5, score = 100
            //   51                   | mov                 edx, dword ptr [ebp - 0x870]
            //   ff15????????         |                     
            //   8985f0feffff         | mov                 al, byte ptr [edx]
            //   83bdf0feffff00       | mov                 byte ptr [ebp - 0x84e], al
            //   0f8499000000         | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_28 = { 51 8b4c2410 56 57 8b7c2414 }
            // n = 5, score = 100
            //   51                   | mov                 eax, dword ptr [ebp - 0x2c]
            //   8b4c2410             | add                 eax, 4
            //   56                   | mov                 dword ptr [ebp - 0x2c], eax
            //   57                   | add                 esp, 0xc
            //   8b7c2414             | cdq                 

        $sequence_29 = { ba5c341200 498bcd e8???????? e9???????? 488bc8 }
            // n = 5, score = 100
            //   ba5c341200           | jb                  0xffffff51
            //   498bcd               | dec                 eax
            //   e8????????           |                     
            //   e9????????           |                     
            //   488bc8               | lea                 edx, [ebx + 0x20]

        $sequence_30 = { 410fb60b 80f962 7c0f 80f979 7f0a }
            // n = 5, score = 100
            //   410fb60b             | mov                 dword ptr [ebp + 0x3a0], eax
            //   80f962               | xor                 esi, esi
            //   7c0f                 | dec                 esp
            //   80f979               | mov                 edi, ecx
            //   7f0a                 | dec                 ebp

        $sequence_31 = { 898590f7ffff 8b8d90f7ffff 898d44f7ffff 8b9590f7ffff 8a02 8885b2f7ffff }
            // n = 6, score = 100
            //   898590f7ffff         | test                edx, edx
            //   8b8d90f7ffff         | jle                 0x7b
            //   898d44f7ffff         | cmp                 edx, 0x20
            //   8b9590f7ffff         | jb                  0x61
            //   8a02                 | and                 eax, 0x8000001f
            //   8885b2f7ffff         | jns                 0x15

        $sequence_32 = { 6a02 8b8d60f8ffff 51 8b9574f8ffff 52 }
            // n = 5, score = 100
            //   6a02                 | mov                 ecx, 7
            //   8b8d60f8ffff         | idiv                ecx
            //   51                   | mov                 dword ptr [ebp - 0x870], eax
            //   8b9574f8ffff         | mov                 ecx, dword ptr [ebp - 0x870]
            //   52                   | mov                 dword ptr [ebp - 0x8bc], ecx

        $sequence_33 = { 8a08 888df7feffff 8b95e4feffff 8a85f7feffff 8802 8b8dd8feffff }
            // n = 6, score = 100
            //   8a08                 | cdq                 
            //   888df7feffff         | mov                 ecx, 7
            //   8b95e4feffff         | add                 esp, 0xc
            //   8a85f7feffff         | cdq                 
            //   8802                 | mov                 ecx, 7
            //   8b8dd8feffff         | idiv                ecx

        $sequence_34 = { c64424210d e8???????? 8b4c2410 8b542414 8b442418 890d???????? }
            // n = 6, score = 100
            //   c64424210d           | mov                 ecx, 7
            //   e8????????           |                     
            //   8b4c2410             | idiv                ecx
            //   8b542414             | add                 esp, 0xc
            //   8b442418             | cdq                 
            //   890d????????         |                     

        $sequence_35 = { 898548f7ffff ff15???????? 68???????? 56 }
            // n = 4, score = 100
            //   898548f7ffff         | mov                 dword ptr [ebp - 0x8b8], eax
            //   ff15????????         |                     
            //   68????????           |                     
            //   56                   | push                esi

        $sequence_36 = { 488d542444 4d8bcd 448bc7 498bcf c744242001000000 }
            // n = 5, score = 100
            //   488d542444           | dec                 eax
            //   4d8bcd               | mov                 ecx, eax
            //   448bc7               | dec                 eax
            //   498bcf               | xor                 eax, esp
            //   c744242001000000     | dec                 eax

        $sequence_37 = { eb05 4a8d543202 ff15???????? 4885c0 0f8482000000 }
            // n = 5, score = 100
            //   eb05                 | jmp                 7
            //   4a8d543202           | dec                 edx
            //   ff15????????         |                     
            //   4885c0               | lea                 edx, [edx + esi + 2]
            //   0f8482000000         | dec                 eax

        $sequence_38 = { 8b450c 0fbe08 83f920 7502 eb2c }
            // n = 5, score = 100
            //   8b450c               | mov                 eax, dword ptr [ebp - 0xc544]
            //   0fbe08               | test                eax, eax
            //   83f920               | je                  0x11
            //   7502                 | push                eax
            //   eb2c                 | add                 esp, 0xc

        $sequence_39 = { 488d5320 488bcb e8???????? 8b93b0af0100 488d0d387b0000 e8???????? 488d9314090000 }
            // n = 7, score = 100
            //   488d5320             | add                 eax, 4
            //   488bcb               | inc                 esi
            //   e8????????           |                     
            //   8b93b0af0100         | dec                 eax
            //   488d0d387b0000       | mov                 dword ptr [esp + 0x28], eax
            //   e8????????           |                     
            //   488d9314090000       | cmp                 esi, ebx

        $sequence_40 = { 5d c3 837d08ff 0f8443040000 e9???????? }
            // n = 5, score = 100
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   837d08ff             | cmp                 dword ptr [ebp + 8], -1
            //   0f8443040000         | je                  0x449
            //   e9????????           |                     

        $sequence_41 = { 42 888160014200 83c9ff 33c0 f2ae f7d1 49 }
            // n = 7, score = 100
            //   42                   | mov                 dword ptr [esp + 0x10], 0
            //   888160014200         | push                edx
            //   83c9ff               | push                eax
            //   33c0                 | push                ecx
            //   f2ae                 | mov                 ecx, dword ptr [esp + 0x10]
            //   f7d1                 | push                esi
            //   49                   | push                edi

        $sequence_42 = { 83f8ff 89442414 0f8428010000 8d542410 c744241000000000 52 50 }
            // n = 7, score = 100
            //   83f8ff               | mov                 edx, dword ptr [ebp - 0x78c]
            //   89442414             | push                edx
            //   0f8428010000         | push                ecx
            //   8d542410             | mov                 dword ptr [ebp - 0x110], eax
            //   c744241000000000     | cmp                 dword ptr [ebp - 0x110], 0
            //   52                   | je                  0xa6
            //   50                   | jmp                 0xb

        $sequence_43 = { 51 52 e8???????? 8be8 83c414 f7dd }
            // n = 6, score = 100
            //   51                   | mov                 ecx, 7
            //   52                   | cmp                 eax, -1
            //   e8????????           |                     
            //   8be8                 | mov                 dword ptr [esp + 0x14], eax
            //   83c414               | je                  0x12e
            //   f7dd                 | lea                 edx, [esp + 0x10]

        $sequence_44 = { 751c 8b542420 8d4c2414 51 }
            // n = 4, score = 100
            //   751c                 | mov                 ecx, 7
            //   8b542420             | idiv                ecx
            //   8d4c2414             | add                 esp, 0xc
            //   51                   | cdq                 

    condition:
        7 of them and filesize < 860160
}