rule win_darkpulsar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.darkpulsar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkpulsar"
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
        $sequence_0 = { ff25???????? ff25???????? 33c0 40 c20c00 68???????? }
            // n = 6, score = 600
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   c20c00               | ret                 0xc
            //   68????????           |                     

        $sequence_1 = { 5b c21000 ff25???????? ff25???????? ff25???????? 33c0 }
            // n = 6, score = 600
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { c20c00 68???????? 64ff3500000000 8b442410 896c2410 8d6c2410 2be0 }
            // n = 7, score = 600
            //   c20c00               | ret                 0xc
            //   68????????           |                     
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp
            //   8d6c2410             | lea                 ebp, [esp + 0x10]
            //   2be0                 | sub                 esp, eax

        $sequence_3 = { 3a01 1bc0 83e0fe 40 5f 5e 5b }
            // n = 7, score = 400
            //   3a01                 | cmp                 al, byte ptr [ecx]
            //   1bc0                 | sbb                 eax, eax
            //   83e0fe               | and                 eax, 0xfffffffe
            //   40                   | inc                 eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_4 = { eb09 803f00 742e 47 ff450c 0fbe07 50 }
            // n = 7, score = 300
            //   eb09                 | jmp                 0xb
            //   803f00               | cmp                 byte ptr [edi], 0
            //   742e                 | je                  0x30
            //   47                   | inc                 edi
            //   ff450c               | inc                 dword ptr [ebp + 0xc]
            //   0fbe07               | movsx               eax, byte ptr [edi]
            //   50                   | push                eax

        $sequence_5 = { ffd6 8bd8 8b450c 0fbe00 50 }
            // n = 5, score = 300
            //   ffd6                 | call                esi
            //   8bd8                 | mov                 ebx, eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   50                   | push                eax

        $sequence_6 = { 3bd8 74e0 0fb607 8b4d0c }
            // n = 4, score = 300
            //   3bd8                 | cmp                 ebx, eax
            //   74e0                 | je                  0xffffffe2
            //   0fb607               | movzx               eax, byte ptr [edi]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_7 = { 57 8b7d08 eb09 803f00 }
            // n = 4, score = 300
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   eb09                 | jmp                 0xb
            //   803f00               | cmp                 byte ptr [edi], 0

        $sequence_8 = { 33d2 56 57 33c0 }
            // n = 4, score = 200
            //   33d2                 | xor                 edx, edx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 59 5e 8b45fc c9 c3 }
            // n = 5, score = 200
            //   59                   | pop                 ecx
            //   5e                   | pop                 esi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c9                   | leave               
            //   c3                   | ret                 

        $sequence_10 = { 5e c9 c3 56 8b742408 85f6 7412 }
            // n = 7, score = 200
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c3                   | ret                 
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   85f6                 | test                esi, esi
            //   7412                 | je                  0x14

        $sequence_11 = { 8d4601 6a01 50 ff15???????? 8bf8 }
            // n = 5, score = 200
            //   8d4601               | lea                 eax, [esi + 1]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_12 = { 6a01 ff15???????? 8bf0 59 59 3bf7 }
            // n = 6, score = 200
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   3bf7                 | cmp                 esi, edi

        $sequence_13 = { 33c9 83c410 83f8ff 0f95c1 49 }
            // n = 5, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   83c410               | add                 esp, 0x10
            //   83f8ff               | cmp                 eax, -1
            //   0f95c1               | setne               cl
            //   49                   | dec                 ecx

        $sequence_14 = { 5f 5e c3 8b442404 85c0 7503 }
            // n = 6, score = 200
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85c0                 | test                eax, eax
            //   7503                 | jne                 5

        $sequence_15 = { 8b5d10 56 8b7508 33d2 }
            // n = 4, score = 200
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33d2                 | xor                 edx, edx

        $sequence_16 = { ffd7 59 5f 5e c3 8b4c2404 85c9 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   85c9                 | test                ecx, ecx

        $sequence_17 = { 8d45cc 50 57 e8???????? 83c410 85c0 }
            // n = 6, score = 200
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   50                   | push                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax

        $sequence_18 = { 50 ff7618 ff15???????? 59 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   ff7618               | push                dword ptr [esi + 0x18]
            //   ff15????????         |                     
            //   59                   | pop                 ecx

        $sequence_19 = { 33c0 eb03 83c8ff 5f 5e c3 56 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   eb03                 | jmp                 5
            //   83c8ff               | or                  eax, 0xffffffff
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   56                   | push                esi

        $sequence_20 = { e8???????? 59 85c0 7625 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7625                 | jbe                 0x27

        $sequence_21 = { 56 e8???????? ff742414 50 e8???????? }
            // n = 5, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_22 = { ff75f4 e8???????? 59 59 83f8ff }
            // n = 5, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   83f8ff               | cmp                 eax, -1

        $sequence_23 = { e8???????? 59 5e 83f8ff }
            // n = 4, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   5e                   | pop                 esi
            //   83f8ff               | cmp                 eax, -1

        $sequence_24 = { ffd6 59 59 8945f0 }
            // n = 4, score = 200
            //   ffd6                 | call                esi
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_25 = { 33c0 33d2 c3 8bff 55 8bec b863736de0 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   33d2                 | xor                 edx, edx
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b863736de0           | mov                 eax, 0xe06d7363

        $sequence_26 = { 8945fc 8b450c 53 8b5d08 56 57 8945e8 }
            // n = 7, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   57                   | push                edi
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax

        $sequence_27 = { e8???????? 8bf0 46 56 ff15???????? 59 59 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   46                   | inc                 esi
            //   56                   | push                esi
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_28 = { 00db 7313 752f 3b742404 0f830b010000 }
            // n = 5, score = 100
            //   00db                 | add                 bl, bl
            //   7313                 | jae                 0x15
            //   752f                 | jne                 0x31
            //   3b742404             | cmp                 esi, dword ptr [esp + 4]
            //   0f830b010000         | jae                 0x111

        $sequence_29 = { 0f84a0000000 6a00 6a01 6a02 }
            // n = 4, score = 100
            //   0f84a0000000         | je                  0xa6
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a02                 | push                2

        $sequence_30 = { 8945dc 8945e0 8945e4 8d45e8 56 8945d4 }
            // n = 6, score = 100
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   56                   | push                esi
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_31 = { 8b35???????? 6a01 ffd6 68f9000000 }
            // n = 4, score = 100
            //   8b35????????         |                     
            //   6a01                 | push                1
            //   ffd6                 | call                esi
            //   68f9000000           | push                0xf9

        $sequence_32 = { 52 64ff37 648927 8dbd6dffffff }
            // n = 4, score = 100
            //   52                   | push                edx
            //   64ff37               | push                dword ptr fs:[edi]
            //   648927               | mov                 dword ptr fs:[edi], esp
            //   8dbd6dffffff         | lea                 edi, [ebp - 0x93]

        $sequence_33 = { 00db 7313 75e1 3b742404 0f8318010000 }
            // n = 5, score = 100
            //   00db                 | add                 bl, bl
            //   7313                 | jae                 0x15
            //   75e1                 | jne                 0xffffffe3
            //   3b742404             | cmp                 esi, dword ptr [esp + 4]
            //   0f8318010000         | jae                 0x11e

        $sequence_34 = { 834dfcff 6a00 6a04 8d450c }
            // n = 4, score = 100
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   6a00                 | push                0
            //   6a04                 | push                4
            //   8d450c               | lea                 eax, [ebp + 0xc]

        $sequence_35 = { 00db 7309 75f4 8a1e 46 10db }
            // n = 6, score = 100
            //   00db                 | add                 bl, bl
            //   7309                 | jae                 0xb
            //   75f4                 | jne                 0xfffffff6
            //   8a1e                 | mov                 bl, byte ptr [esi]
            //   46                   | inc                 esi
            //   10db                 | adc                 bl, bl

        $sequence_36 = { 8bd5 5d 8bc3 5b c3 e9???????? 55 }
            // n = 7, score = 100
            //   8bd5                 | mov                 edx, ebp
            //   5d                   | pop                 ebp
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   e9????????           |                     
            //   55                   | push                ebp

        $sequence_37 = { 8b4e14 51 8bf8 c7461001000000 ff15???????? 8bce e8???????? }
            // n = 7, score = 100
            //   8b4e14               | mov                 ecx, dword ptr [esi + 0x14]
            //   51                   | push                ecx
            //   8bf8                 | mov                 edi, eax
            //   c7461001000000       | mov                 dword ptr [esi + 0x10], 1
            //   ff15????????         |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_38 = { 56 e8???????? 59 6af4 5f }
            // n = 5, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6af4                 | push                -0xc
            //   5f                   | pop                 edi

        $sequence_39 = { 0bc1 c3 8b442404 ff30 e8???????? }
            // n = 5, score = 100
            //   0bc1                 | or                  eax, ecx
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   ff30                 | push                dword ptr [eax]
            //   e8????????           |                     

        $sequence_40 = { 0fb75604 52 8b16 52 }
            // n = 4, score = 100
            //   0fb75604             | movzx               edx, word ptr [esi + 4]
            //   52                   | push                edx
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   52                   | push                edx

        $sequence_41 = { c3 e9???????? 8b4c2404 8bc1 }
            // n = 4, score = 100
            //   c3                   | ret                 
            //   e9????????           |                     
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   8bc1                 | mov                 eax, ecx

        $sequence_42 = { 8b4d98 41 3bc1 7510 6a50 8d45a0 }
            // n = 6, score = 100
            //   8b4d98               | mov                 ecx, dword ptr [ebp - 0x68]
            //   41                   | inc                 ecx
            //   3bc1                 | cmp                 eax, ecx
            //   7510                 | jne                 0x12
            //   6a50                 | push                0x50
            //   8d45a0               | lea                 eax, [ebp - 0x60]

        $sequence_43 = { e9???????? 8b4c2404 8b442408 884101 c1e808 8801 8d4102 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   884101               | mov                 byte ptr [ecx + 1], al
            //   c1e808               | shr                 eax, 8
            //   8801                 | mov                 byte ptr [ecx], al
            //   8d4102               | lea                 eax, [ecx + 2]

        $sequence_44 = { e8???????? 83c408 85c0 755b 68???????? 57 c7463806000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   755b                 | jne                 0x5d
            //   68????????           |                     
            //   57                   | push                edi
            //   c7463806000000       | mov                 dword ptr [esi + 0x38], 6

        $sequence_45 = { 741b 8b4e74 8b561c 51 8b4df8 52 }
            // n = 6, score = 100
            //   741b                 | je                  0x1d
            //   8b4e74               | mov                 ecx, dword ptr [esi + 0x74]
            //   8b561c               | mov                 edx, dword ptr [esi + 0x1c]
            //   51                   | push                ecx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 491520
}