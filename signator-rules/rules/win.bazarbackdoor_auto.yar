rule win_bazarbackdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bazarbackdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bazarbackdoor"
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
        $sequence_0 = { 0fb6c8 e8???????? 85c0 7403 }
            // n = 4, score = 1800
            //   0fb6c8               | movzx               ecx, al
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5

        $sequence_1 = { 8a03 3c20 7709 84c0 7431 4084ff }
            // n = 6, score = 1600
            //   8a03                 | jmp                 0xffffffd4
            //   3c20                 | cmp                 al, 0x20
            //   7709                 | ja                  0xf
            //   84c0                 | dec                 eax
            //   7431                 | inc                 ebx
            //   4084ff               | mov                 al, byte ptr [ebx]

        $sequence_2 = { 84c0 7431 4084ff 741f 3c22 7507 }
            // n = 6, score = 1600
            //   84c0                 | cmp                 al, 0x22
            //   7431                 | jne                 0x12
            //   4084ff               | inc                 eax
            //   741f                 | test                bh, bh
            //   3c22                 | dec                 eax
            //   7507                 | inc                 ebx

        $sequence_3 = { ebd2 3c20 7709 48ffc3 }
            // n = 4, score = 1600
            //   ebd2                 | cmp                 al, 0x22
            //   3c20                 | jne                 0xb
            //   7709                 | inc                 eax
            //   48ffc3               | test                bh, bh

        $sequence_4 = { 741f 3c22 7507 4084ff 400f94c7 0fb6c8 e8???????? }
            // n = 7, score = 1600
            //   741f                 | je                  0x2a
            //   3c22                 | cmp                 al, 0x22
            //   7507                 | je                  5
            //   4084ff               | dec                 eax
            //   400f94c7             | inc                 ebx
            //   0fb6c8               | dec                 eax
            //   e8????????           |                     

        $sequence_5 = { 41b80f100000 488bce 4889442420 ff15???????? }
            // n = 4, score = 1500
            //   41b80f100000         | inc                 ebx
            //   488bce               | jmp                 0xffffffd4
            //   4889442420           | cmp                 al, 0x20
            //   ff15????????         |                     

        $sequence_6 = { ff15???????? 85c0 780a 4898 }
            // n = 4, score = 1500
            //   ff15????????         |                     
            //   85c0                 | test                bh, bh
            //   780a                 | dec                 eax
            //   4898                 | inc                 ebx

        $sequence_7 = { b902000000 e8???????? e8???????? 8bc8 e8???????? e8???????? 8bd8 }
            // n = 7, score = 1400
            //   b902000000           | mov                 dword ptr [esp + 0x20], eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   8bc8                 | test                eax, eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   8bd8                 | js                  0xe

        $sequence_8 = { 488905???????? 4885c0 750a b840000000 e9???????? }
            // n = 5, score = 1300
            //   488905????????       |                     
            //   4885c0               | test                bh, bh
            //   750a                 | inc                 eax
            //   b840000000           | sete                bh
            //   e9????????           |                     

        $sequence_9 = { 83f9ff 74df e8???????? 830d????????ff }
            // n = 4, score = 1300
            //   83f9ff               | jmp                 0xffffffd4
            //   74df                 | cmp                 al, 0x20
            //   e8????????           |                     
            //   830d????????ff       |                     

        $sequence_10 = { b803000000 e9???????? 660f6f05???????? 33c0 }
            // n = 4, score = 1300
            //   b803000000           | inc                 eax
            //   e9????????           |                     
            //   660f6f05????????     |                     
            //   33c0                 | test                bh, bh

        $sequence_11 = { 488bcf ffd0 b802000000 e9???????? }
            // n = 4, score = 1300
            //   488bcf               | ja                  0xd
            //   ffd0                 | dec                 eax
            //   b802000000           | inc                 ebx
            //   e9????????           |                     

        $sequence_12 = { 488bf8 eb02 33ff 83630c00 }
            // n = 4, score = 1300
            //   488bf8               | cmp                 al, 0x22
            //   eb02                 | jne                 0xb
            //   33ff                 | inc                 eax
            //   83630c00             | test                bh, bh

        $sequence_13 = { b903000000 e8???????? 90 cc 48895c2408 }
            // n = 5, score = 1300
            //   b903000000           | test                bh, bh
            //   e8????????           |                     
            //   90                   | inc                 eax
            //   cc                   | sete                bh
            //   48895c2408           | movzx               ecx, al

        $sequence_14 = { 4885c0 750a b830000000 e9???????? }
            // n = 4, score = 1300
            //   4885c0               | mov                 al, byte ptr [ebx]
            //   750a                 | test                al, al
            //   b830000000           | inc                 eax
            //   e9????????           |                     

        $sequence_15 = { e8???????? 33c0 4883c428 c3 4885d2 74e4 4885c9 }
            // n = 7, score = 1200
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   4883c428             | mov                 eax, 0xff
            //   c3                   | ret                 
            //   4885d2               | movzx               ecx, word ptr [eax + ecx + 0x18]
            //   74e4                 | mov                 eax, 0x10b
            //   4885c9               | cmp                 cx, ax

        $sequence_16 = { ff15???????? 0fb74f02 0fb7d8 ff15???????? 0fb74f08 }
            // n = 5, score = 1100
            //   ff15????????         |                     
            //   0fb74f02             | dec                 eax
            //   0fb7d8               | mov                 dword ptr [eax + 8], ecx
            //   ff15????????         |                     
            //   0fb74f08             | dec                 eax

        $sequence_17 = { 7507 33c0 e9???????? b8ff000000 }
            // n = 4, score = 1000
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   b8ff000000           | mov                 eax, 0xff

        $sequence_18 = { c3 0fb74c0818 b80b010000 663bc8 }
            // n = 4, score = 900
            //   c3                   | dec                 eax
            //   0fb74c0818           | inc                 ebx
            //   b80b010000           | jmp                 0xffffffd7
            //   663bc8               | cmp                 al, 0x20

        $sequence_19 = { e8???????? 4889c7 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4889c7               | dec                 eax
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_20 = { ff15???????? 4889c1 31d2 4d89e0 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   4889c1               | dec                 eax
            //   31d2                 | cwde                
            //   4d89e0               | call                eax

        $sequence_21 = { 31ff 4889c1 31d2 4989f0 }
            // n = 4, score = 800
            //   31ff                 | test                eax, eax
            //   4889c1               | js                  0xe
            //   31d2                 | test                eax, eax
            //   4989f0               | js                  0xc

        $sequence_22 = { 4889f1 e8???????? 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   4889f1               | dec                 eax
            //   e8????????           |                     
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_23 = { e8???????? 4c89e1 e8???????? 8b05???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4c89e1               | mov                 ecx, esi
            //   e8????????           |                     
            //   8b05????????         |                     

        $sequence_24 = { e8???????? 4889f9 4889f2 ffd0 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   4889f9               | dec                 eax
            //   4889f2               | mov                 dword ptr [esp + 0x20], eax
            //   ffd0                 | test                eax, eax

        $sequence_25 = { 4889c1 31d2 4989f8 ff15???????? 4885c0 }
            // n = 5, score = 700
            //   4889c1               | dec                 eax
            //   31d2                 | mov                 dword ptr [esp + 0x20], eax
            //   4989f8               | test                eax, eax
            //   ff15????????         |                     
            //   4885c0               | js                  0x13

        $sequence_26 = { e8???????? 8b0d???????? 8d51ff 0fafd1 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   8d51ff               | cmp                 al, 0x20
            //   0fafd1               | ja                  0xd

        $sequence_27 = { 8bd3 e8???????? 33c0 e9???????? }
            // n = 4, score = 700
            //   8bd3                 | test                eax, eax
            //   e8????????           |                     
            //   33c0                 | js                  0x13
            //   e9????????           |                     

        $sequence_28 = { 4889f0 4883c438 5b 5d 5f }
            // n = 5, score = 700
            //   4889f0               | dec                 eax
            //   4883c438             | mov                 ecx, dword ptr [esp + 0x58]
            //   5b                   | div                 dword ptr [ecx + 0x50]
            //   5d                   | mov                 eax, edx
            //   5f                   | test                eax, eax

        $sequence_29 = { 0fb64b04 0fb6d1 80f973 7504 }
            // n = 4, score = 700
            //   0fb64b04             | mov                 dword ptr [esp + 0x20], eax
            //   0fb6d1               | test                eax, eax
            //   80f973               | js                  0x16
            //   7504                 | inc                 ecx

        $sequence_30 = { e8???????? 8b05???????? 8b15???????? 8d48ff 0fafc8 89c8 83f0fe }
            // n = 7, score = 700
            //   e8????????           |                     
            //   8b05????????         |                     
            //   8b15????????         |                     
            //   8d48ff               | xor                 bh, bh
            //   0fafc8               | mov                 al, byte ptr [ebx]
            //   89c8                 | cmp                 al, 0x20
            //   83f0fe               | ja                  0x16

        $sequence_31 = { c744242880000000 c744242003000000 4889f9 ba00000080 41b801000000 4531c9 }
            // n = 6, score = 700
            //   c744242880000000     | js                  0x16
            //   c744242003000000     | dec                 eax
            //   4889f9               | cwde                
            //   ba00000080           | dec                 eax
            //   41b801000000         | mov                 dword ptr [esp + 0x20], eax
            //   4531c9               | test                eax, eax

        $sequence_32 = { e9???????? 8b05???????? 8b0d???????? 8d50ff 0fafd0 89d0 83f0fe }
            // n = 7, score = 700
            //   e9????????           |                     
            //   8b05????????         |                     
            //   8b0d????????         |                     
            //   8d50ff               | sete                bh
            //   0fafd0               | movzx               ecx, al
            //   89d0                 | test                eax, eax
            //   83f0fe               | je                  0xe

        $sequence_33 = { 56 57 53 4883ec20 4889d7 }
            // n = 5, score = 700
            //   56                   | test                eax, eax
            //   57                   | inc                 ecx
            //   53                   | mov                 eax, 0x100f
            //   4883ec20             | dec                 eax
            //   4889d7               | mov                 ecx, esi

        $sequence_34 = { 80f973 7504 0fb65305 33c0 80f973 0f94c0 }
            // n = 6, score = 700
            //   80f973               | dec                 eax
            //   7504                 | mov                 ecx, esi
            //   0fb65305             | dec                 eax
            //   33c0                 | mov                 dword ptr [esp + 0x20], eax
            //   80f973               | test                eax, eax
            //   0f94c0               | js                  0x13

        $sequence_35 = { 57 55 53 4881ec78010000 }
            // n = 4, score = 700
            //   57                   | cmp                 dword ptr [esp + 0x78], eax
            //   55                   | jbe                 0x11
            //   53                   | dec                 eax
            //   4881ec78010000       | mov                 eax, dword ptr [esp + 0x78]

        $sequence_36 = { ff15???????? 31ed 4889c1 31d2 }
            // n = 4, score = 700
            //   ff15????????         |                     
            //   31ed                 | mov                 dword ptr [esp + 0x20], eax
            //   4889c1               | dec                 eax
            //   31d2                 | mov                 dword ptr [esp + 0x20], eax

        $sequence_37 = { e8???????? b902000000 31d2 ffd0 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   b902000000           | inc                 eax
            //   31d2                 | test                bh, bh
            //   ffd0                 | inc                 eax

        $sequence_38 = { c644242800 8b05???????? 8d48ff 0fafc8 }
            // n = 4, score = 700
            //   c644242800           | int3                
            //   8b05????????         |                     
            //   8d48ff               | dec                 eax
            //   0fafc8               | mov                 dword ptr [esp + 8], ebx

        $sequence_39 = { c3 8b05???????? 8d50ff 0fafd0 }
            // n = 4, score = 700
            //   c3                   | sete                bh
            //   8b05????????         |                     
            //   8d50ff               | movzx               ecx, al
            //   0fafd0               | test                eax, eax

        $sequence_40 = { e8???????? 4c897c2420 4889d9 89fa }
            // n = 4, score = 600
            //   e8????????           |                     
            //   4c897c2420           | mov                 eax, dword ptr [edi + 0x50]
            //   4889d9               | inc                 ecx
            //   89fa                 | mov                 ecx, 0x3000

        $sequence_41 = { 4889c1 31d2 4d89e8 ff15???????? }
            // n = 4, score = 600
            //   4889c1               | dec                 eax
            //   31d2                 | mov                 ecx, esi
            //   4d89e8               | dec                 eax
            //   ff15????????         |                     

        $sequence_42 = { 4889da e8???????? 4889f1 4889da }
            // n = 4, score = 600
            //   4889da               | mov                 dword ptr [esp + 0x20], eax
            //   e8????????           |                     
            //   4889f1               | inc                 ecx
            //   4889da               | mov                 eax, 0x100f

        $sequence_43 = { 84d2 7405 80fa2e 750f }
            // n = 4, score = 600
            //   84d2                 | test                eax, eax
            //   7405                 | js                  0x16
            //   80fa2e               | dec                 eax
            //   750f                 | mov                 ecx, esi

        $sequence_44 = { 8a02 84c0 75c5 c6443c1000 84db }
            // n = 5, score = 400
            //   8a02                 | mov                 al, byte ptr [edx]
            //   84c0                 | test                al, al
            //   75c5                 | jne                 0xffffffc7
            //   c6443c1000           | mov                 byte ptr [esp + edi + 0x10], 0
            //   84db                 | test                bl, bl

        $sequence_45 = { ffd0 eb02 8bc3 a3???????? 85c0 7507 6a04 }
            // n = 7, score = 400
            //   ffd0                 | call                eax
            //   eb02                 | jmp                 4
            //   8bc3                 | mov                 eax, ebx
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   6a04                 | push                4

        $sequence_46 = { 59 59 85c0 740f 56 8d542414 8bc8 }
            // n = 7, score = 400
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11
            //   56                   | push                esi
            //   8d542414             | lea                 edx, [esp + 0x14]
            //   8bc8                 | mov                 ecx, eax

        $sequence_47 = { 6889010000 6841587c4c 6a04 5a e8???????? }
            // n = 5, score = 400
            //   6889010000           | push                0x189
            //   6841587c4c           | push                0x4c7c5841
            //   6a04                 | push                4
            //   5a                   | pop                 edx
            //   e8????????           |                     

        $sequence_48 = { 66890d???????? 0fb7ca ff15???????? b901000000 66c746020100 668906 }
            // n = 6, score = 400
            //   66890d????????       |                     
            //   0fb7ca               | mov                 ecx, esi
            //   ff15????????         |                     
            //   b901000000           | dec                 eax
            //   66c746020100         | mov                 dword ptr [esp + 0x20], eax
            //   668906               | test                eax, eax

        $sequence_49 = { eb02 33f6 8b54240c 85d2 7505 5f }
            // n = 6, score = 400
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]
            //   85d2                 | test                edx, edx
            //   7505                 | jne                 7
            //   5f                   | pop                 edi

        $sequence_50 = { 6a7e 68e6b5a12c 42 e8???????? 59 59 85c0 }
            // n = 7, score = 400
            //   6a7e                 | push                0x7e
            //   68e6b5a12c           | push                0x2ca1b5e6
            //   42                   | inc                 edx
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_51 = { 0fb745e8 50 68???????? e8???????? }
            // n = 4, score = 400
            //   0fb745e8             | movzx               eax, word ptr [ebp - 0x18]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_52 = { 81feff030000 733c 8a02 3cc0 721e 0fb6c8 0fb64201 }
            // n = 7, score = 300
            //   81feff030000         | sete                bh
            //   733c                 | movzx               ecx, al
            //   8a02                 | jne                 9
            //   3cc0                 | inc                 eax
            //   721e                 | test                bh, bh
            //   0fb6c8               | inc                 eax
            //   0fb64201             | sete                bh

        $sequence_53 = { 8be5 5d c3 6a40 6800300000 ff7750 }
            // n = 6, score = 300
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a40                 | push                0x40
            //   6800300000           | push                0x3000
            //   ff7750               | push                dword ptr [edi + 0x50]

        $sequence_54 = { 85d2 740d 33d2 83f902 0f95c2 83c224 }
            // n = 6, score = 300
            //   85d2                 | test                edx, edx
            //   740d                 | je                  0xf
            //   33d2                 | xor                 edx, edx
            //   83f902               | cmp                 ecx, 2
            //   0f95c2               | setne               dl
            //   83c224               | add                 edx, 0x24

        $sequence_55 = { 88041a 8bd1 41 3bcf 72e5 }
            // n = 5, score = 300
            //   88041a               | mov                 byte ptr [edx + ebx], al
            //   8bd1                 | mov                 edx, ecx
            //   41                   | inc                 ecx
            //   3bcf                 | cmp                 ecx, edi
            //   72e5                 | jb                  0xffffffe7

        $sequence_56 = { 8bf0 8d7e02 57 6a08 }
            // n = 4, score = 300
            //   8bf0                 | mov                 esi, eax
            //   8d7e02               | lea                 edi, [esi + 2]
            //   57                   | push                edi
            //   6a08                 | push                8

        $sequence_57 = { 8b3d???????? 8d7001 8d4610 50 6a08 }
            // n = 5, score = 300
            //   8b3d????????         |                     
            //   8d7001               | lea                 esi, [eax + 1]
            //   8d4610               | lea                 eax, [esi + 0x10]
            //   50                   | push                eax
            //   6a08                 | push                8

        $sequence_58 = { 50 8bd9 53 6a02 ff15???????? }
            // n = 5, score = 300
            //   50                   | cmp                 al, 0x20
            //   8bd9                 | ja                  0xb
            //   53                   | test                al, al
            //   6a02                 | je                  0x37
            //   ff15????????         |                     

        $sequence_59 = { 0f95c2 83c224 eb05 ba29000000 }
            // n = 4, score = 300
            //   0f95c2               | setne               dl
            //   83c224               | add                 edx, 0x24
            //   eb05                 | jmp                 7
            //   ba29000000           | mov                 edx, 0x29

        $sequence_60 = { 660f73d801 660febd0 660f7ed0 84c0 }
            // n = 4, score = 300
            //   660f73d801           | psrldq              xmm0, 1
            //   660febd0             | por                 xmm2, xmm0
            //   660f7ed0             | movd                eax, xmm2
            //   84c0                 | test                al, al

        $sequence_61 = { 8d7001 81fe80000000 760c 80e1f2 80c902 }
            // n = 5, score = 300
            //   8d7001               | lea                 esi, [eax + 1]
            //   81fe80000000         | cmp                 esi, 0x80
            //   760c                 | jbe                 0xe
            //   80e1f2               | and                 cl, 0xf2
            //   80c902               | or                  cl, 2

        $sequence_62 = { 41b904000000 41b800100000 8bd0 488b4c2440 }
            // n = 4, score = 100
            //   41b904000000         | inc                 eax
            //   41b800100000         | test                bh, bh
            //   8bd0                 | inc                 eax
            //   488b4c2440           | sete                bh

        $sequence_63 = { 488b4c2458 f77150 8bc2 85c0 751e }
            // n = 5, score = 100
            //   488b4c2458           | je                  0x11
            //   f77150               | mov                 al, byte ptr [ebx]
            //   8bc2                 | cmp                 al, 0x20
            //   85c0                 | ja                  0xb
            //   751e                 | test                al, al

        $sequence_64 = { 7516 488b442448 0fb700 89442420 }
            // n = 4, score = 100
            //   7516                 | test                bh, bh
            //   488b442448           | je                  0x26
            //   0fb700               | cmp                 al, 0x22
            //   89442420             | jne                 0x12

        $sequence_65 = { 4c89442418 89542410 48894c2408 4883ec48 8b442458 89442424 48c744242800000000 }
            // n = 7, score = 100
            //   4c89442418           | test                eax, eax
            //   89542410             | dec                 eax
            //   48894c2408           | cmovne              ebx, eax
            //   4883ec48             | inc                 eax
            //   8b442458             | xor                 bh, bh
            //   89442424             | mov                 al, byte ptr [ebx]
            //   48c744242800000000     | cmp    al, 0x20

        $sequence_66 = { 488b00 b908000000 486bc900 488d840888000000 4889442450 488b442450 }
            // n = 6, score = 100
            //   488b00               | inc                 eax
            //   b908000000           | test                bh, bh
            //   486bc900             | inc                 eax
            //   488d840888000000     | sete                bh
            //   4889442450           | movzx               ecx, al
            //   488b442450           | test                eax, eax

        $sequence_67 = { ff542430 488b442428 4883781000 746a }
            // n = 4, score = 100
            //   ff542430             | movzx               ecx, al
            //   488b442428           | test                eax, eax
            //   4883781000           | je                  0xa
            //   746a                 | dec                 eax

        $sequence_68 = { 48894808 488b442438 0fb74016 2500200000 85c0 }
            // n = 5, score = 100
            //   48894808             | ja                  0x16
            //   488b442438           | test                al, al
            //   0fb74016             | dec                 eax
            //   2500200000           | inc                 ebx
            //   85c0                 | jmp                 0xffffffd4

        $sequence_69 = { 4889442478 488b442470 4839442478 760a 488b442478 4889442470 eb88 }
            // n = 7, score = 100
            //   4889442478           | je                  0x37
            //   488b442470           | inc                 eax
            //   4839442478           | test                bh, bh
            //   760a                 | je                  0x2a
            //   488b442478           | test                al, al
            //   4889442470           | je                  0x33
            //   eb88                 | inc                 eax

    condition:
        7 of them and filesize < 2088960
}