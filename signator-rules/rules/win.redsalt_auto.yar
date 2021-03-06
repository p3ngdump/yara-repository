rule win_redsalt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.redsalt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redsalt"
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
        $sequence_0 = { 750b 68e8030000 ff15???????? e8???????? 85c0 }
            // n = 5, score = 1100
            //   750b                 | jne                 0xd
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 83c414 33c9 83f8ff 0f95c1 }
            // n = 4, score = 1100
            //   83c414               | add                 esp, 0x14
            //   33c9                 | xor                 ecx, ecx
            //   83f8ff               | cmp                 eax, -1
            //   0f95c1               | setne               cl

        $sequence_2 = { 51 ffd6 85c0 7510 }
            // n = 4, score = 900
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12

        $sequence_3 = { 85c0 7515 c705????????01000000 ff15???????? e9???????? }
            // n = 5, score = 900
            //   85c0                 | test                eax, eax
            //   7515                 | jne                 0x17
            //   c705????????01000000     |     
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_4 = { e8???????? 85c0 750a 6a32 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750a                 | jne                 0xc
            //   6a32                 | push                0x32

        $sequence_5 = { c745d060ea0000 6a04 8d45d0 50 6806100000 68ffff0000 }
            // n = 6, score = 900
            //   c745d060ea0000       | mov                 dword ptr [ebp - 0x30], 0xea60
            //   6a04                 | push                4
            //   8d45d0               | lea                 eax, [ebp - 0x30]
            //   50                   | push                eax
            //   6806100000           | push                0x1006
            //   68ffff0000           | push                0xffff

        $sequence_6 = { 8b5508 52 e8???????? 83c414 6a00 6a01 }
            // n = 6, score = 800
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   6a00                 | push                0
            //   6a01                 | push                1

        $sequence_7 = { 83c9ff 85f6 7c0e 83fe7f }
            // n = 4, score = 800
            //   83c9ff               | or                  ecx, 0xffffffff
            //   85f6                 | test                esi, esi
            //   7c0e                 | jl                  0x10
            //   83fe7f               | cmp                 esi, 0x7f

        $sequence_8 = { c744242401000000 8944242c c744243002000000 ff15???????? }
            // n = 4, score = 700
            //   c744242401000000     | mov                 dword ptr [esp + 0x24], 1
            //   8944242c             | mov                 dword ptr [esp + 0x2c], eax
            //   c744243002000000     | mov                 dword ptr [esp + 0x30], 2
            //   ff15????????         |                     

        $sequence_9 = { 8d8530fcffff 50 e8???????? 83c40c }
            // n = 4, score = 700
            //   8d8530fcffff         | lea                 eax, [ebp - 0x3d0]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_10 = { c60100 5f 5e 33c0 }
            // n = 4, score = 700
            //   c60100               | mov                 byte ptr [ecx], 0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_11 = { 6a00 52 c744242401000000 8944242c }
            // n = 4, score = 700
            //   6a00                 | push                0
            //   52                   | push                edx
            //   c744242401000000     | mov                 dword ptr [esp + 0x24], 1
            //   8944242c             | mov                 dword ptr [esp + 0x2c], eax

        $sequence_12 = { 7509 80780120 7503 83c002 }
            // n = 4, score = 700
            //   7509                 | jne                 0xb
            //   80780120             | cmp                 byte ptr [eax + 1], 0x20
            //   7503                 | jne                 5
            //   83c002               | add                 eax, 2

        $sequence_13 = { 83c40c eb02 33c0 8b4df4 }
            // n = 4, score = 700
            //   83c40c               | add                 esp, 0xc
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_14 = { e8???????? 50 6804010000 68???????? }
            // n = 4, score = 600
            //   e8????????           |                     
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   68????????           |                     

        $sequence_15 = { e8???????? 83c408 6800010000 68???????? }
            // n = 4, score = 600
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   6800010000           | push                0x100
            //   68????????           |                     

        $sequence_16 = { 833800 750f c705????????01000000 e9???????? }
            // n = 4, score = 500
            //   833800               | cmp                 dword ptr [eax], 0
            //   750f                 | jne                 0x11
            //   c705????????01000000     |     
            //   e9????????           |                     

        $sequence_17 = { eb03 83cfff 8bc7 c1f802 c0e204 0ac2 8b542410 }
            // n = 7, score = 500
            //   eb03                 | jmp                 5
            //   83cfff               | or                  edi, 0xffffffff
            //   8bc7                 | mov                 eax, edi
            //   c1f802               | sar                 eax, 2
            //   c0e204               | shl                 dl, 4
            //   0ac2                 | or                  al, dl
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]

        $sequence_18 = { c1e902 894c2420 0f841e010000 0fbe08 }
            // n = 4, score = 500
            //   c1e902               | shr                 ecx, 2
            //   894c2420             | mov                 dword ptr [esp + 0x20], ecx
            //   0f841e010000         | je                  0x124
            //   0fbe08               | movsx               ecx, byte ptr [eax]

        $sequence_19 = { c644243423 c644243572 c64424367a c644243700 }
            // n = 4, score = 300
            //   c644243423           | mov                 byte ptr [esp + 0x34], 0x23
            //   c644243572           | mov                 byte ptr [esp + 0x35], 0x72
            //   c64424367a           | mov                 byte ptr [esp + 0x36], 0x7a
            //   c644243700           | mov                 byte ptr [esp + 0x37], 0

        $sequence_20 = { d2cc bbe3b46b7e 6aa2 dd45ff }
            // n = 4, score = 200
            //   d2cc                 | ror                 ah, cl
            //   bbe3b46b7e           | mov                 ebx, 0x7e6bb4e3
            //   6aa2                 | push                -0x5e
            //   dd45ff               | fld                 qword ptr [ebp - 1]

        $sequence_21 = { c8201cdd f7be5b408d58 1b7f01 d2cc }
            // n = 4, score = 200
            //   c8201cdd             | enter               0x1c20, -0x23
            //   f7be5b408d58         | idiv                dword ptr [esi + 0x588d405b]
            //   1b7f01               | sbb                 edi, dword ptr [edi + 1]
            //   d2cc                 | ror                 ah, cl

        $sequence_22 = { e9???????? 4889442438 48895c2438 488907 }
            // n = 4, score = 100
            //   e9????????           |                     
            //   4889442438           | test                edx, edx
            //   48895c2438           | dec                 ebp
            //   488907               | mov                 ebx, eax

        $sequence_23 = { e9???????? 4885ed 0f84c2feffff 418bd5 }
            // n = 4, score = 100
            //   e9????????           |                     
            //   4885ed               | dec                 esp
            //   0f84c2feffff         | mov                 edx, edx
            //   418bd5               | je                  0x12a93

        $sequence_24 = { e9???????? 4885d2 4d8bd8 4c8bd2 }
            // n = 4, score = 100
            //   e9????????           |                     
            //   4885d2               | sub                 esp, 0x20
            //   4d8bd8               | dec                 eax
            //   4c8bd2               | test                ecx, ecx

        $sequence_25 = { e9???????? 4885c9 7472 48895c2408 }
            // n = 4, score = 100
            //   e9????????           |                     
            //   4885c9               | dec                 eax
            //   7472                 | test                ecx, ecx
            //   48895c2408           | je                  0x74

    condition:
        7 of them and filesize < 2957312
}