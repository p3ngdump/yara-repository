rule win_grease_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.grease."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grease"
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
        $sequence_0 = { 52 50 683f000f00 50 50 }
            // n = 5, score = 400
            //   52                   | push                edx
            //   50                   | push                eax
            //   683f000f00           | push                0xf003f
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_1 = { 4533c9 48897c2440 4889442438 48897c2430 }
            // n = 4, score = 300
            //   4533c9               | inc                 ebp
            //   48897c2440           | xor                 ecx, ecx
            //   4889442438           | dec                 eax
            //   48897c2430           | mov                 dword ptr [esp + 0x40], edi

        $sequence_2 = { 4533c0 488bd3 c744242804000000 4889442420 }
            // n = 4, score = 300
            //   4533c0               | dec                 eax
            //   488bd3               | mov                 dword ptr [esp + 0x38], eax
            //   c744242804000000     | dec                 eax
            //   4889442420           | mov                 dword ptr [esp + 0x30], edi

        $sequence_3 = { ff15???????? b801000000 488b8c2480020000 4833cc }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   b801000000           | xor                 ecx, ecx
            //   488b8c2480020000     | inc                 ebp
            //   4833cc               | xor                 eax, eax

        $sequence_4 = { c74424281f000200 895c2420 ff15???????? 85c0 0f85e7000000 488b4c2460 488d442458 }
            // n = 7, score = 300
            //   c74424281f000200     | mov                 ecx, 4
            //   895c2420             | inc                 ebp
            //   ff15????????         |                     
            //   85c0                 | xor                 eax, eax
            //   0f85e7000000         | dec                 eax
            //   488b4c2460           | mov                 edx, ebx
            //   488d442458           | mov                 dword ptr [esp + 0x28], 4

        $sequence_5 = { 4533c9 4533c0 4889442420 ff15???????? 85c0 7537 }
            // n = 6, score = 300
            //   4533c9               | test                eax, eax
            //   4533c0               | jne                 0xef
            //   4889442420           | dec                 eax
            //   ff15????????         |                     
            //   85c0                 | mov                 ecx, dword ptr [esp + 0x60]
            //   7537                 | dec                 eax

        $sequence_6 = { 488d442458 41b904000000 4533c0 488bd3 }
            // n = 4, score = 300
            //   488d442458           | xor                 eax, eax
            //   41b904000000         | dec                 eax
            //   4533c0               | mov                 dword ptr [esp + 0x38], eax
            //   488bd3               | dec                 eax

        $sequence_7 = { 4889442438 48897c2430 4533c0 c74424283f000f00 }
            // n = 4, score = 300
            //   4889442438           | dec                 eax
            //   48897c2430           | mov                 dword ptr [esp + 0x20], eax
            //   4533c0               | mov                 dword ptr [esp + 0x28], 0x2001f
            //   c74424283f000f00     | mov                 dword ptr [esp + 0x20], ebx

        $sequence_8 = { 4533c9 4533c0 c74424283f000f00 897c2420 }
            // n = 4, score = 300
            //   4533c9               | mov                 dword ptr [esp + 0x38], eax
            //   4533c0               | dec                 eax
            //   c74424283f000f00     | mov                 dword ptr [esp + 0x30], edi
            //   897c2420             | inc                 ebp

        $sequence_9 = { ffd6 8d4c2418 68???????? 51 c744241c00000000 }
            // n = 5, score = 200
            //   ffd6                 | xor                 eax, eax
            //   8d4c2418             | mov                 dword ptr [esp + 0x28], 0xf003f
            //   68????????           |                     
            //   51                   | mov                 dword ptr [esp + 0x20], edi
            //   c744241c00000000     | dec                 eax

        $sequence_10 = { 8d7801 8a08 83c001 3acb 75f7 2bc7 8b3d???????? }
            // n = 7, score = 200
            //   8d7801               | mov                 dword ptr [esp + 0x40], edi
            //   8a08                 | dec                 eax
            //   83c001               | mov                 dword ptr [esp + 0x38], eax
            //   3acb                 | dec                 eax
            //   75f7                 | mov                 dword ptr [esp + 0x30], edi
            //   2bc7                 | inc                 ebp
            //   8b3d????????         |                     

        $sequence_11 = { c68434140200002f eb1c c68434140200003f eb12 c68434140200002e }
            // n = 5, score = 200
            //   c68434140200002f     | mov                 byte ptr [esp + esi + 0x214], 0x2f
            //   eb1c                 | jmp                 0x1e
            //   c68434140200003f     | mov                 byte ptr [esp + esi + 0x214], 0x3f
            //   eb12                 | jmp                 0x14
            //   c68434140200002e     | mov                 byte ptr [esp + esi + 0x214], 0x2e

        $sequence_12 = { 56 ffd7 8d442424 68???????? }
            // n = 4, score = 200
            //   56                   | mov                 ecx, 4
            //   ffd7                 | inc                 ebp
            //   8d442424             | xor                 eax, eax
            //   68????????           |                     

        $sequence_13 = { 59 8bc6 5e 5b c9 c3 3b0d???????? }
            // n = 7, score = 200
            //   59                   | inc                 ebp
            //   8bc6                 | xor                 eax, eax
            //   5e                   | mov                 dword ptr [esp + 0x28], 0xf003f
            //   5b                   | mov                 dword ptr [esp + 0x20], edi
            //   c9                   | jne                 0x36
            //   c3                   | dec                 eax
            //   3b0d????????         |                     

        $sequence_14 = { 8d48ff 7414 8a813cc04000 8bd1 88840c2c080000 49 85d2 }
            // n = 7, score = 200
            //   8d48ff               | lea                 ecx, [eax - 1]
            //   7414                 | je                  0x16
            //   8a813cc04000         | mov                 al, byte ptr [ecx + 0x40c03c]
            //   8bd1                 | mov                 edx, ecx
            //   88840c2c080000       | mov                 byte ptr [esp + ecx + 0x82c], al
            //   49                   | dec                 ecx
            //   85d2                 | test                edx, edx

        $sequence_15 = { 81ec0c020000 a1???????? 33c4 89842408020000 e8???????? }
            // n = 5, score = 200
            //   81ec0c020000         | mov                 dword ptr [esp + 0x38], eax
            //   a1????????           |                     
            //   33c4                 | dec                 eax
            //   89842408020000       | mov                 dword ptr [esp + 0x30], edi
            //   e8????????           |                     

        $sequence_16 = { 8b44242c 68???????? 50 ffd6 85c0 }
            // n = 5, score = 200
            //   8b44242c             | mov                 ecx, dword ptr [esp + 0x50]
            //   68????????           |                     
            //   50                   | dec                 eax
            //   ffd6                 | lea                 eax, [esp + 0x58]
            //   85c0                 | inc                 ecx

        $sequence_17 = { c6440c0878 e9???????? c6440c0863 e9???????? }
            // n = 4, score = 200
            //   c6440c0878           | mov                 byte ptr [esp + ecx + 8], 0x78
            //   e9????????           |                     
            //   c6440c0863           | mov                 byte ptr [esp + ecx + 8], 0x63
            //   e9????????           |                     

        $sequence_18 = { e9???????? c684343009000078 e9???????? c684343009000063 e9???????? c68434300900006c e9???????? }
            // n = 7, score = 200
            //   e9????????           |                     
            //   c684343009000078     | mov                 byte ptr [esp + esi + 0x930], 0x78
            //   e9????????           |                     
            //   c684343009000063     | mov                 byte ptr [esp + esi + 0x930], 0x63
            //   e9????????           |                     
            //   c68434300900006c     | mov                 byte ptr [esp + esi + 0x930], 0x6c
            //   e9????????           |                     

        $sequence_19 = { c644243c01 885c243d 885c243e 885c243f ff15???????? }
            // n = 5, score = 200
            //   c644243c01           | mov                 ecx, dword ptr [esp + 0x50]
            //   885c243d             | inc                 ebp
            //   885c243e             | xor                 ecx, ecx
            //   885c243f             | dec                 eax
            //   ff15????????         |                     

        $sequence_20 = { e9???????? c684343009000075 e9???????? c68434300900006e }
            // n = 4, score = 200
            //   e9????????           |                     
            //   c684343009000075     | mov                 byte ptr [esp + esi + 0x930], 0x75
            //   e9????????           |                     
            //   c68434300900006e     | mov                 byte ptr [esp + esi + 0x930], 0x6e

        $sequence_21 = { 8d0c8d80c64000 3bc1 7304 3910 7402 33c0 }
            // n = 6, score = 200
            //   8d0c8d80c64000       | lea                 ecx, [ecx*4 + 0x40c680]
            //   3bc1                 | cmp                 eax, ecx
            //   7304                 | jae                 6
            //   3910                 | cmp                 dword ptr [eax], edx
            //   7402                 | je                  4
            //   33c0                 | xor                 eax, eax

        $sequence_22 = { 75f4 33f6 3bfd 0f8616020000 8a443420 }
            // n = 5, score = 200
            //   75f4                 | jne                 0xfffffff6
            //   33f6                 | xor                 esi, esi
            //   3bfd                 | cmp                 edi, ebp
            //   0f8616020000         | jbe                 0x21c
            //   8a443420             | mov                 al, byte ptr [esp + esi + 0x20]

    condition:
        7 of them and filesize < 278528
}