rule win_winnti_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.winnti."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.winnti"
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
        $sequence_0 = { 53 50 53 897c2424 c744242001000000 891e }
            // n = 6, score = 200
            //   53                   | push                ebx
            //   50                   | push                eax
            //   53                   | push                ebx
            //   897c2424             | mov                 dword ptr [esp + 0x24], edi
            //   c744242001000000     | mov                 dword ptr [esp + 0x20], 1
            //   891e                 | mov                 dword ptr [esi], ebx

        $sequence_1 = { ff15???????? 55 e8???????? 8b542414 52 e8???????? 83c408 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   55                   | push                ebp
            //   e8????????           |                     
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_2 = { ffd7 50 89461c ff15???????? }
            // n = 4, score = 200
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   ff15????????         |                     

        $sequence_3 = { 56 8bb42470020000 57 8dbc2460010000 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   8bb42470020000       | mov                 esi, dword ptr [esp + 0x270]
            //   57                   | push                edi
            //   8dbc2460010000       | lea                 edi, [esp + 0x160]

        $sequence_4 = { 3bc6 8931 743d 8b942440060000 8b84243c060000 8b8c2430060000 }
            // n = 6, score = 200
            //   3bc6                 | cmp                 eax, esi
            //   8931                 | mov                 dword ptr [ecx], esi
            //   743d                 | je                  0x3f
            //   8b942440060000       | mov                 edx, dword ptr [esp + 0x640]
            //   8b84243c060000       | mov                 eax, dword ptr [esp + 0x63c]
            //   8b8c2430060000       | mov                 ecx, dword ptr [esp + 0x630]

        $sequence_5 = { e8???????? 8be8 83c404 85ed 0f84d9010000 8bce }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8be8                 | mov                 ebp, eax
            //   83c404               | add                 esp, 4
            //   85ed                 | test                ebp, ebp
            //   0f84d9010000         | je                  0x1df
            //   8bce                 | mov                 ecx, esi

        $sequence_6 = { ff15???????? 8b44241c 8d542420 52 50 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   8d542420             | lea                 edx, [esp + 0x20]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_7 = { b867666666 2bcb 41 f7e9 }
            // n = 4, score = 200
            //   b867666666           | mov                 eax, 0x66666667
            //   2bcb                 | sub                 ecx, ebx
            //   41                   | inc                 ecx
            //   f7e9                 | imul                ecx

        $sequence_8 = { 488bc4 48895808 48897010 4c894018 57 4156 }
            // n = 6, score = 100
            //   488bc4               | dec                 eax
            //   48895808             | cmp                 ebp, eax
            //   48897010             | je                  0x46
            //   4c894018             | dec                 eax
            //   57                   | test                eax, eax
            //   4156                 | inc                 esp

        $sequence_9 = { 4883ec20 488d05276a0100 8bfa 488bd9 488901 }
            // n = 5, score = 100
            //   4883ec20             | cmp                 byte ptr [ecx], 0x66
            //   488d05276a0100       | js                  0x587
            //   8bfa                 | cmp                 dword ptr [ebx], esi
            //   488bd9               | je                  0x581
            //   488901               | dec                 eax

        $sequence_10 = { 498bce e8???????? 49637e5c 897d97 8d4701 4189465c }
            // n = 6, score = 100
            //   498bce               | dec                 eax
            //   e8????????           |                     
            //   49637e5c             | add                 edi, 2
            //   897d97               | mov                 dword ptr [edi + 0x64], 0x20
            //   8d4701               | test                eax, eax
            //   4189465c             | je                  0x9a

        $sequence_11 = { 4489742460 4c897018 418bfe 488d354f1e0000 4533c9 4533c0 488d5098 }
            // n = 7, score = 100
            //   4489742460           | lea                 ecx, [esp + 0x70]
            //   4c897018             | inc                 ecx
            //   418bfe               | shr                 ecx, 1
            //   488d354f1e0000       | inc                 edx
            //   4533c9               | mov                 ecx, dword ptr [esi + ecx*4]
            //   4533c0               | dec                 eax
            //   488d5098             | lea                 eax, [ecx + edi]

        $sequence_12 = { 488bd9 4885d2 7426 4883c9ff 48897c2430 }
            // n = 5, score = 100
            //   488bd9               | inc                 esp
            //   4885d2               | lea                 ecx, [ecx - 0x2c]
            //   7426                 | nop                 word ptr [eax + eax]
            //   4883c9ff             | dec                 eax
            //   48897c2430           | mov                 eax, esi

        $sequence_13 = { 7423 4c63c0 4c8d0d6816ffff 498bc8 4183e01f 48c1f905 }
            // n = 6, score = 100
            //   7423                 | inc                 edx
            //   4c63c0               | movzx               edx, word ptr [edi + eax]
            //   4c8d0d6816ffff       | lea                 eax, [edx - 0x41]
            //   498bc8               | cmp                 ax, 0x19
            //   4183e01f             | ja                  0xd
            //   48c1f905             | add                 dx, 0x20

        $sequence_14 = { 0f8881050000 3933 0f8479050000 488d8d60010000 ba04010000 ff15???????? 8985b0030000 }
            // n = 7, score = 100
            //   0f8881050000         | mov                 eax, esp
            //   3933                 | dec                 eax
            //   0f8479050000         | mov                 dword ptr [eax + 8], ebx
            //   488d8d60010000       | dec                 eax
            //   ba04010000           | mov                 dword ptr [eax + 0x10], esi
            //   ff15????????         |                     
            //   8985b0030000         | dec                 esp

        $sequence_15 = { 4885c9 7421 448b41f8 488d59f8 4c8d0d1aedffff ba30000000 e8???????? }
            // n = 7, score = 100
            //   4885c9               | lea                 ecx, [ebp + 0x160]
            //   7421                 | mov                 edx, 0x104
            //   448b41f8             | mov                 dword ptr [ebp + 0x3b0], eax
            //   488d59f8             | mov                 ecx, 0x3c
            //   4c8d0d1aedffff       | dec                 esp
            //   ba30000000           | mov                 eax, edx
            //   e8????????           |                     

        $sequence_16 = { 6683c120 420fb71407 8d42bf 6683f819 7704 6683c220 4883c702 }
            // n = 7, score = 100
            //   6683c120             | mov                 dword ptr [esp + 0x60], esi
            //   420fb71407           | dec                 esp
            //   8d42bf               | mov                 dword ptr [eax + 0x18], esi
            //   6683f819             | inc                 ecx
            //   7704                 | mov                 edi, esi
            //   6683c220             | dec                 eax
            //   4883c702             | lea                 esi, [0x1e4f]

        $sequence_17 = { c7476420000000 ff15???????? 85c0 0f8492000000 }
            // n = 4, score = 100
            //   c7476420000000       | inc                 ebp
            //   ff15????????         |                     
            //   85c0                 | xor                 ecx, ecx
            //   0f8492000000         | inc                 ebp

        $sequence_18 = { 448965c7 48894dcf 8945d7 4c8d45bf 33d2 488bcb e8???????? }
            // n = 7, score = 100
            //   448965c7             | dec                 ecx
            //   48894dcf             | mov                 ecx, eax
            //   8945d7               | inc                 ecx
            //   4c8d45bf             | and                 eax, 0x1f
            //   33d2                 | dec                 eax
            //   488bcb               | sar                 ecx, 5
            //   e8????????           |                     

        $sequence_19 = { 7442 b901000000 0f1f440000 41803966 }
            // n = 4, score = 100
            //   7442                 | xor                 eax, eax
            //   b901000000           | dec                 eax
            //   0f1f440000           | lea                 edx, [eax - 0x68]
            //   41803966             | dec                 eax

        $sequence_20 = { 478d0c1a 41d1e9 428b0c8e 488d0439 483be8 7441 4885c0 }
            // n = 7, score = 100
            //   478d0c1a             | inc                 edi
            //   41d1e9               | lea                 ecx, [edx + ebx]
            //   428b0c8e             | inc                 ecx
            //   488d0439             | shr                 ecx, 1
            //   483be8               | inc                 edx
            //   7441                 | mov                 ecx, dword ptr [esi + ecx*4]
            //   4885c0               | dec                 eax

        $sequence_21 = { 4c8d9c2440030000 498b5b10 498b7b18 498be3 }
            // n = 4, score = 100
            //   4c8d9c2440030000     | je                  0x44
            //   498b5b10             | mov                 ecx, 1
            //   498b7b18             | nop                 dword ptr [eax + eax]
            //   498be3               | inc                 ecx

        $sequence_22 = { 668930 e8???????? 85c0 785a 488d4c2470 e8???????? }
            // n = 6, score = 100
            //   668930               | lea                 eax, [ecx + edi]
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   785a                 | cmp                 ebp, eax
            //   488d4c2470           | je                  0x46
            //   e8????????           |                     

        $sequence_23 = { 8b42f8 8903 8b42fc 894304 e8???????? 41ffc4 }
            // n = 6, score = 100
            //   8b42f8               | je                  0x25
            //   8903                 | dec                 esp
            //   8b42fc               | arpl                ax, ax
            //   894304               | dec                 esp
            //   e8????????           |                     
            //   41ffc4               | lea                 ecx, [0xffff1668]

    condition:
        7 of them and filesize < 1581056
}