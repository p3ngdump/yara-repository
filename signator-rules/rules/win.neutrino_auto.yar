rule win_neutrino_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.neutrino."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neutrino"
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
        $sequence_0 = { ff15???????? c1e010 50 ff15???????? }
            // n = 4, score = 2300
            //   ff15????????         |                     
            //   c1e010               | shl                 eax, 0x10
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_1 = { 85c0 741b e8???????? 85c0 7412 e8???????? 85c0 }
            // n = 7, score = 1800
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_2 = { 50 6a0b 6a07 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a0b                 | push                0xb
            //   6a07                 | push                7
            //   e8????????           |                     

        $sequence_3 = { 50 6a05 6a03 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a05                 | push                5
            //   6a03                 | push                3
            //   e8????????           |                     

        $sequence_4 = { 83fa01 7509 8b4508 83c001 894508 8b4dfc 3b4d14 }
            // n = 7, score = 1500
            //   83fa01               | cmp                 edx, 1
            //   7509                 | jne                 0xb
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c001               | add                 eax, 1
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   3b4d14               | cmp                 ecx, dword ptr [ebp + 0x14]

        $sequence_5 = { 0404 010404 0202 020402 0404 }
            // n = 5, score = 1500
            //   0404                 | add                 al, 4
            //   010404               | add                 dword ptr [esp + eax], eax
            //   0202                 | add                 al, byte ptr [edx]
            //   020402               | add                 al, byte ptr [edx + eax]
            //   0404                 | add                 al, 4

        $sequence_6 = { 6a00 ff15???????? 6880000000 ff15???????? }
            // n = 4, score = 1500
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6880000000           | push                0x80
            //   ff15????????         |                     

        $sequence_7 = { 894dfc 8b55f4 83c201 8955f4 ebaf 8b45f4 a3???????? }
            // n = 7, score = 1500
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   83c201               | add                 edx, 1
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   ebaf                 | jmp                 0xffffffb1
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   a3????????           |                     

        $sequence_8 = { 0fbe11 3bc2 740b 8b45fc 83c001 8945fc ebdb }
            // n = 7, score = 1500
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   3bc2                 | cmp                 eax, edx
            //   740b                 | je                  0xd
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ebdb                 | jmp                 0xffffffdd

        $sequence_9 = { 8b4508 a3???????? 8b0d???????? 894df8 eb09 8b55f8 83c201 }
            // n = 7, score = 1500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   a3????????           |                     
            //   8b0d????????         |                     
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   eb09                 | jmp                 0xb
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   83c201               | add                 edx, 1

        $sequence_10 = { 0404 0404 0404 0404 0404 0402 0202 }
            // n = 7, score = 1500
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0402                 | add                 al, 2
            //   0202                 | add                 al, byte ptr [edx]

        $sequence_11 = { e9???????? 6a01 ff15???????? 85c0 }
            // n = 4, score = 1500
            //   e9????????           |                     
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_12 = { 7531 8b45fc 83c001 8945fc 8b4d08 83c101 894d08 }
            // n = 7, score = 1500
            //   7531                 | jne                 0x33
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   83c101               | add                 ecx, 1
            //   894d08               | mov                 dword ptr [ebp + 8], ecx

        $sequence_13 = { 7439 8b550c 8955fc 8b45fc 0fbe08 85c9 741b }
            // n = 7, score = 1500
            //   7439                 | je                  0x3b
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   85c9                 | test                ecx, ecx
            //   741b                 | je                  0x1d

        $sequence_14 = { 6a00 6a00 e8???????? 83c40c 0fb6c0 }
            // n = 5, score = 1500
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0fb6c0               | movzx               eax, al

        $sequence_15 = { 8b45f8 0fbe08 85c9 7439 8b550c 8955fc }
            // n = 6, score = 1500
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   85c9                 | test                ecx, ecx
            //   7439                 | je                  0x3b
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8955fc               | mov                 dword ptr [ebp - 4], edx

        $sequence_16 = { 7502 eb02 ebb4 8b45f8 8945f4 8b4d0c 894dfc }
            // n = 7, score = 1500
            //   7502                 | jne                 4
            //   eb02                 | jmp                 4
            //   ebb4                 | jmp                 0xffffffb6
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_17 = { 7521 6800020000 51 ff35???????? c7460480000000 ff15???????? 8906 }
            // n = 7, score = 1300
            //   7521                 | jne                 0x23
            //   6800020000           | push                0x200
            //   51                   | push                ecx
            //   ff35????????         |                     
            //   c7460480000000       | mov                 dword ptr [esi + 4], 0x80
            //   ff15????????         |                     
            //   8906                 | mov                 dword ptr [esi], eax

        $sequence_18 = { bb???????? 8bfa 32c0 c645ff00 895dec c645fb00 }
            // n = 6, score = 1300
            //   bb????????           |                     
            //   8bfa                 | mov                 edi, edx
            //   32c0                 | xor                 al, al
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   c645fb00             | mov                 byte ptr [ebp - 5], 0

        $sequence_19 = { 48 753c 807dfd04 c645fc03 0f84ae000000 807dfd05 eb12 }
            // n = 7, score = 1300
            //   48                   | dec                 eax
            //   753c                 | jne                 0x3e
            //   807dfd04             | cmp                 byte ptr [ebp - 3], 4
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   0f84ae000000         | je                  0xb4
            //   807dfd05             | cmp                 byte ptr [ebp - 3], 5
            //   eb12                 | jmp                 0x14

        $sequence_20 = { 8b03 894210 83c304 f645fe04 7431 8b4218 a810 }
            // n = 7, score = 1300
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   894210               | mov                 dword ptr [edx + 0x10], eax
            //   83c304               | add                 ebx, 4
            //   f645fe04             | test                byte ptr [ebp - 2], 4
            //   7431                 | je                  0x33
            //   8b4218               | mov                 eax, dword ptr [edx + 0x18]
            //   a810                 | test                al, 0x10

        $sequence_21 = { 807dfd01 0f8597000000 e9???????? 2d8c000000 747e 48 48 }
            // n = 7, score = 1300
            //   807dfd01             | cmp                 byte ptr [ebp - 3], 1
            //   0f8597000000         | jne                 0x9d
            //   e9????????           |                     
            //   2d8c000000           | sub                 eax, 0x8c
            //   747e                 | je                  0x80
            //   48                   | dec                 eax
            //   48                   | dec                 eax

        $sequence_22 = { c645fb00 f3aa c645f810 56 8b45f4 8a00 ff45f4 }
            // n = 7, score = 1300
            //   c645fb00             | mov                 byte ptr [ebp - 5], 0
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   c645f810             | mov                 byte ptr [ebp - 8], 0x10
            //   56                   | push                esi
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8a00                 | mov                 al, byte ptr [eax]
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]

        $sequence_23 = { 814a1800900000 807df900 8b45f0 743f 83e820 741d }
            // n = 6, score = 1300
            //   814a1800900000       | or                  dword ptr [edx + 0x18], 0x9000
            //   807df900             | cmp                 byte ptr [ebp - 7], 0
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   743f                 | je                  0x41
            //   83e820               | sub                 eax, 0x20
            //   741d                 | je                  0x1f

        $sequence_24 = { 83c404 85c0 0f95c2 0fb6c2 }
            // n = 4, score = 1200
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   0f95c2               | setne               dl
            //   0fb6c2               | movzx               eax, dl

        $sequence_25 = { 55 8bec 81ecf80f0000 837d0800 }
            // n = 4, score = 1100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ecf80f0000         | sub                 esp, 0xff8
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0

        $sequence_26 = { 8d85b8feffff 50 68???????? ff15???????? }
            // n = 4, score = 1100
            //   8d85b8feffff         | lea                 eax, [ebp - 0x148]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_27 = { 83c40c 6804010000 8d85f8fdffff 50 }
            // n = 4, score = 1000
            //   83c40c               | add                 esp, 0xc
            //   6804010000           | push                0x104
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]
            //   50                   | push                eax

        $sequence_28 = { ff15???????? 57 8906 ff15???????? 83c604 83c703 81fe???????? }
            // n = 7, score = 800
            //   ff15????????         |                     
            //   57                   | push                edi
            //   8906                 | mov                 dword ptr [esi], eax
            //   ff15????????         |                     
            //   83c604               | add                 esi, 4
            //   83c703               | add                 edi, 3
            //   81fe????????         |                     

        $sequence_29 = { 68???????? 50 ff15???????? f7d8 1bc0 40 c3 }
            // n = 7, score = 800
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   f7d8                 | neg                 eax
            //   1bc0                 | sbb                 eax, eax
            //   40                   | inc                 eax
            //   c3                   | ret                 

        $sequence_30 = { ff7510 ff750c ff7508 ff15???????? 83f8ff 0f95c0 5d }
            // n = 7, score = 800
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   0f95c0               | setne               al
            //   5d                   | pop                 ebp

        $sequence_31 = { 50 ff15???????? 6a40 ff75f0 }
            // n = 4, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a40                 | push                0x40
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_32 = { 50 ff15???????? 837dfc00 0f95c0 c9 c3 }
            // n = 6, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   0f95c0               | setne               al
            //   c9                   | leave               
            //   c3                   | ret                 

    condition:
        7 of them and filesize < 507904
}