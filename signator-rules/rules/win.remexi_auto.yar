rule win_remexi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.remexi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.remexi"
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
        $sequence_0 = { 56 c706ffffffff e8???????? 83c404 }
            // n = 4, score = 300
            //   56                   | push                esi
            //   c706ffffffff         | mov                 dword ptr [esi], 0xffffffff
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_1 = { 89470c 57 894710 ff15???????? 6a00 }
            // n = 5, score = 200
            //   89470c               | mov                 dword ptr [edi + 0xc], eax
            //   57                   | push                edi
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_2 = { 6a00 6a02 c785ccfeffff28010000 ff15???????? }
            // n = 4, score = 200
            //   6a00                 | jne                 0x15
            //   6a02                 | mov                 eax, dword ptr [ebp - 0x28]
            //   c785ccfeffff28010000     | mov    ecx, dword ptr [eax + 0x18]
            //   ff15????????         |                     

        $sequence_3 = { 6a10 8d4ddc 8bf0 51 }
            // n = 4, score = 200
            //   6a10                 | push                2
            //   8d4ddc               | push                0x10
            //   8bf0                 | lea                 ecx, [ebp - 0x24]
            //   51                   | push                2

        $sequence_4 = { 52 6a00 68ffff1f00 ffd7 8bf0 }
            // n = 5, score = 200
            //   52                   | mov                 edx, dword ptr [ecx + 4]
            //   6a00                 | push                eax
            //   68ffff1f00           | mov                 dword ptr [ebp - 0x20], edx
            //   ffd7                 | jne                 0x15
            //   8bf0                 | mov                 eax, dword ptr [ebp - 0x28]

        $sequence_5 = { e8???????? 6a01 6a00 6a00 ff15???????? 8bf8 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_6 = { 7513 8b45d8 8b4818 8b5104 }
            // n = 4, score = 200
            //   7513                 | lea                 ecx, [ebp - 0x24]
            //   8b45d8               | mov                 esi, eax
            //   8b4818               | push                ecx
            //   8b5104               | push                2

        $sequence_7 = { 6a00 50 6a02 ff15???????? 6a10 }
            // n = 5, score = 200
            //   6a00                 | dec                 eax
            //   50                   | mov                 eax, ebx
            //   6a02                 | dec                 eax
            //   ff15????????         |                     
            //   6a10                 | mov                 ecx, dword ptr [esp + 0x58]

        $sequence_8 = { c705????????ffffffff c705????????01000000 c705????????00000000 ffd6 83ffff 7407 }
            // n = 6, score = 200
            //   c705????????ffffffff     |     
            //   c705????????01000000     |     
            //   c705????????00000000     |     
            //   ffd6                 | call                esi
            //   83ffff               | cmp                 edi, -1
            //   7407                 | je                  9

        $sequence_9 = { 894704 894708 6a01 89470c 57 }
            // n = 5, score = 200
            //   894704               | mov                 dword ptr [edi + 4], eax
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   6a01                 | push                1
            //   89470c               | mov                 dword ptr [edi + 0xc], eax
            //   57                   | push                edi

        $sequence_10 = { 68???????? 50 ff15???????? 8b0d???????? 8b35???????? 890d???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   8b35????????         |                     
            //   890d????????         |                     

        $sequence_11 = { 6828010000 8d8dccfeffff 6a00 51 }
            // n = 4, score = 200
            //   6828010000           | push                eax
            //   8d8dccfeffff         | push                2
            //   6a00                 | push                0x10
            //   51                   | lea                 ecx, [ebp - 0x24]

        $sequence_12 = { ff15???????? 57 8b3d???????? ffd7 56 ffd7 5e }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   ffd7                 | call                edi
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   5e                   | pop                 esi

        $sequence_13 = { 8945e0 8945e4 8945e8 b802000000 51 }
            // n = 5, score = 200
            //   8945e0               | mov                 esi, eax
            //   8945e4               | push                ecx
            //   8945e8               | push                esi
            //   b802000000           | push                0x10
            //   51                   | lea                 ecx, [ebp - 0x24]

        $sequence_14 = { 8b35???????? 890d???????? 68???????? 41 50 a3???????? }
            // n = 6, score = 200
            //   8b35????????         |                     
            //   890d????????         |                     
            //   68????????           |                     
            //   41                   | inc                 ecx
            //   50                   | push                eax
            //   a3????????           |                     

        $sequence_15 = { e8???????? b900000708 e8???????? b900000b07 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   b900000708           | dec                 ecx
            //   e8????????           |                     
            //   b900000b07           | or                  eax, 0xffffffff

        $sequence_16 = { c744242002000000 41b99f860100 4c8d4308 488d542430 488bcb e8???????? }
            // n = 6, score = 100
            //   c744242002000000     | dec                 eax
            //   41b99f860100         | lea                 ecx, [ebp + 8]
            //   4c8d4308             | mov                 dword ptr [esp + 0x20], 2
            //   488d542430           | inc                 ecx
            //   488bcb               | mov                 ecx, 0x1869f
            //   e8????????           |                     

        $sequence_17 = { e9???????? 48c78424f00000000f000000 4889b424e8000000 c68424d800000000 4533c0 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   48c78424f00000000f000000     | mov    ecx, 0x8070000
            //   4889b424e8000000     | mov                 ecx, 0x70b0000
            //   c68424d800000000     | dec                 eax
            //   4533c0               | mov                 dword ptr [esp + 0x70], eax

        $sequence_18 = { 4889442470 f645e001 740c 488b4588 }
            // n = 4, score = 100
            //   4889442470           | dec                 ecx
            //   f645e001             | mov                 ecx, ebp
            //   740c                 | xor                 edx, edx
            //   488b4588             | dec                 eax

        $sequence_19 = { e8???????? 90 488d4b08 e8???????? 90 488d4d08 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   90                   | nop                 
            //   488d4b08             | dec                 eax
            //   e8????????           |                     
            //   90                   | lea                 ecx, [ebx + 8]
            //   488d4d08             | nop                 

        $sequence_20 = { 498bcd e8???????? 33d2 488bfd eb09 4d85ed 7404 }
            // n = 7, score = 100
            //   498bcd               | dec                 eax
            //   e8????????           |                     
            //   33d2                 | mov                 ecx, ebx
            //   488bfd               | jne                 7
            //   eb09                 | dec                 ebp
            //   4d85ed               | mov                 eax, esi
            //   7404                 | jmp                 0x16

        $sequence_21 = { 7505 4d8bc6 eb11 4983c8ff }
            // n = 4, score = 100
            //   7505                 | dec                 esp
            //   4d8bc6               | lea                 eax, [ebx + 8]
            //   eb11                 | dec                 eax
            //   4983c8ff             | lea                 edx, [esp + 0x30]

        $sequence_22 = { 4c897710 c60700 488bc3 488b4c2458 4833cc }
            // n = 5, score = 100
            //   4c897710             | mov                 edi, ebp
            //   c60700               | jmp                 0xe
            //   488bc3               | dec                 ebp
            //   488b4c2458           | test                ebp, ebp
            //   4833cc               | je                  0xe

    condition:
        7 of them and filesize < 614400
}