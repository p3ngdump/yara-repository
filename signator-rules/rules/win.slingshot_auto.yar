rule win_slingshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.slingshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.slingshot"
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
        $sequence_0 = { 50 33db 53 ff15???????? 8bf0 3bf3 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   3bf3                 | cmp                 esi, ebx

        $sequence_1 = { 49 83c310 48 83eb01 43 8b0481 }
            // n = 6, score = 100
            //   49                   | dec                 ecx
            //   83c310               | add                 ebx, 0x10
            //   48                   | dec                 eax
            //   83eb01               | sub                 ebx, 1
            //   43                   | inc                 ebx
            //   8b0481               | mov                 eax, dword ptr [ecx + eax*4]

        $sequence_2 = { 48 8b95e0000000 8b8d80000000 e8???????? 894524 }
            // n = 5, score = 100
            //   48                   | dec                 eax
            //   8b95e0000000         | mov                 edx, dword ptr [ebp + 0xe0]
            //   8b8d80000000         | mov                 ecx, dword ptr [ebp + 0x80]
            //   e8????????           |                     
            //   894524               | mov                 dword ptr [ebp + 0x24], eax

        $sequence_3 = { 3bcb 7411 ff75fc ff31 ff15???????? 3bc3 59 }
            // n = 7, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7411                 | je                  0x13
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff31                 | push                dword ptr [ecx]
            //   ff15????????         |                     
            //   3bc3                 | cmp                 eax, ebx
            //   59                   | pop                 ecx

        $sequence_4 = { bad1040000 33c9 e8???????? eb0f bad4040000 }
            // n = 5, score = 100
            //   bad1040000           | mov                 edx, 0x4d1
            //   33c9                 | xor                 ecx, ecx
            //   e8????????           |                     
            //   eb0f                 | jmp                 0x11
            //   bad4040000           | mov                 edx, 0x4d4

        $sequence_5 = { 48 8bd0 48 8d0deb880000 e8???????? }
            // n = 5, score = 100
            //   48                   | dec                 eax
            //   8bd0                 | mov                 edx, eax
            //   48                   | dec                 eax
            //   8d0deb880000         | lea                 ecx, [0x88eb]
            //   e8????????           |                     

        $sequence_6 = { 5b c3 55 8bec 81ec34020000 53 }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec34020000         | sub                 esp, 0x234
            //   53                   | push                ebx

        $sequence_7 = { eb09 b8ffff0000 66894108 48 8b5c2408 }
            // n = 5, score = 100
            //   eb09                 | jmp                 0xb
            //   b8ffff0000           | mov                 eax, 0xffff
            //   66894108             | mov                 word ptr [ecx + 8], ax
            //   48                   | dec                 eax
            //   8b5c2408             | mov                 ebx, dword ptr [esp + 8]

        $sequence_8 = { ba0a0000ff 48 8bcb e8???????? 85c0 }
            // n = 5, score = 100
            //   ba0a0000ff           | mov                 edx, 0xff00000a
            //   48                   | dec                 eax
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_9 = { 3bcb 7442 395dfc 7414 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7442                 | je                  0x44
            //   395dfc               | cmp                 dword ptr [ebp - 4], ebx
            //   7414                 | je                  0x16

        $sequence_10 = { 03c1 50 890e e8???????? 33c0 40 }
            // n = 6, score = 100
            //   03c1                 | add                 eax, ecx
            //   50                   | push                eax
            //   890e                 | mov                 dword ptr [esi], ecx
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax

        $sequence_11 = { 42 8b449708 8944b708 41 }
            // n = 4, score = 100
            //   42                   | inc                 edx
            //   8b449708             | mov                 eax, dword ptr [edi + edx*4 + 8]
            //   8944b708             | mov                 dword ptr [edi + esi*4 + 8], eax
            //   41                   | inc                 ecx

        $sequence_12 = { 3bcb 743b 6afe 58 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   743b                 | je                  0x3d
            //   6afe                 | push                -2
            //   58                   | pop                 eax

        $sequence_13 = { 8945f0 33c0 668906 eb02 }
            // n = 4, score = 100
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   33c0                 | xor                 eax, eax
            //   668906               | mov                 word ptr [esi], ax
            //   eb02                 | jmp                 4

        $sequence_14 = { 3bcb 7413 ff7514 ff7510 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7413                 | je                  0x15
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_15 = { ff37 ffd6 a3???????? 3bc3 7507 686c654d00 eba9 }
            // n = 7, score = 100
            //   ff37                 | push                dword ptr [edi]
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   7507                 | jne                 9
            //   686c654d00           | push                0x4d656c
            //   eba9                 | jmp                 0xffffffab

        $sequence_16 = { 8944245c 89442440 89442428 89442454 }
            // n = 4, score = 100
            //   8944245c             | mov                 dword ptr [esp + 0x5c], eax
            //   89442440             | mov                 dword ptr [esp + 0x40], eax
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   89442454             | mov                 dword ptr [esp + 0x54], eax

        $sequence_17 = { 41 83c00c 3bca 72e9 eb0e 41 }
            // n = 6, score = 100
            //   41                   | inc                 ecx
            //   83c00c               | add                 eax, 0xc
            //   3bca                 | cmp                 ecx, edx
            //   72e9                 | jb                  0xffffffeb
            //   eb0e                 | jmp                 0x10
            //   41                   | inc                 ecx

        $sequence_18 = { 3bcb 7420 0fb700 d1e8 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7420                 | je                  0x22
            //   0fb700               | movzx               eax, word ptr [eax]
            //   d1e8                 | shr                 eax, 1

        $sequence_19 = { 744a 83e901 7419 83f907 755f 48 }
            // n = 6, score = 100
            //   744a                 | je                  0x4c
            //   83e901               | sub                 ecx, 1
            //   7419                 | je                  0x1b
            //   83f907               | cmp                 ecx, 7
            //   755f                 | jne                 0x61
            //   48                   | dec                 eax

        $sequence_20 = { 3bcb 7415 8b45fc 83c014 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7415                 | je                  0x17
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c014               | add                 eax, 0x14

        $sequence_21 = { c745f008000000 8b750c 43 23d8 8b4c9a08 }
            // n = 5, score = 100
            //   c745f008000000       | mov                 dword ptr [ebp - 0x10], 8
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   43                   | inc                 ebx
            //   23d8                 | and                 ebx, eax
            //   8b4c9a08             | mov                 ecx, dword ptr [edx + ebx*4 + 8]

        $sequence_22 = { 3bcb 7426 ff750c 51 }
            // n = 4, score = 100
            //   3bcb                 | cmp                 ecx, ebx
            //   7426                 | je                  0x28
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 663552
}