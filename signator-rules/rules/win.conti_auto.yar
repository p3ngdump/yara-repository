rule win_conti_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.conti."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.conti"
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
        $sequence_0 = { 85c0 750f c705????????0b000000 e9???????? }
            // n = 4, score = 900
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0b000000     |     
            //   e9????????           |                     

        $sequence_1 = { 83c00b 99 83c117 f7f9 }
            // n = 4, score = 600
            //   83c00b               | add                 eax, 0xb
            //   99                   | cdq                 
            //   83c117               | add                 ecx, 0x17
            //   f7f9                 | idiv                ecx

        $sequence_2 = { 83c10b f7e9 c1fa02 8bc2 }
            // n = 4, score = 600
            //   83c10b               | add                 ecx, 0xb
            //   f7e9                 | imul                ecx
            //   c1fa02               | sar                 edx, 2
            //   8bc2                 | mov                 eax, edx

        $sequence_3 = { 8856ff 83ef01 75de 5f }
            // n = 4, score = 600
            //   8856ff               | mov                 ecx, dword ptr [ebp + 0x940]
            //   83ef01               | dec                 eax
            //   75de                 | xor                 ecx, esp
            //   5f                   | dec                 eax

        $sequence_4 = { 83c10b f7e9 03d1 c1fa04 8bc2 }
            // n = 5, score = 600
            //   83c10b               | add                 ecx, 0xb
            //   f7e9                 | imul                ecx
            //   03d1                 | add                 edx, ecx
            //   c1fa04               | sar                 edx, 4
            //   8bc2                 | mov                 eax, edx

        $sequence_5 = { ffd0 85c0 750f c705????????0c000000 }
            // n = 4, score = 600
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0c000000     |     

        $sequence_6 = { 8b0d???????? 85c0 ba0d000000 0f44ca 890d???????? }
            // n = 5, score = 600
            //   8b0d????????         |                     
            //   85c0                 | test                eax, eax
            //   ba0d000000           | mov                 edx, 0xd
            //   0f44ca               | cmove               ecx, edx
            //   890d????????         |                     

        $sequence_7 = { bf0e000000 8d7101 8d5f71 8a06 8d7601 0fb6c0 }
            // n = 6, score = 600
            //   bf0e000000           | add                 esp, 0xa50
            //   8d7101               | pop                 edi
            //   8d5f71               | dec                 ecx
            //   8a06                 | mov                 ecx, dword ptr [esi + 8]
            //   8d7601               | inc                 esp
            //   0fb6c0               | mov                 eax, ebp

        $sequence_8 = { 85c0 750f c705????????0a000000 e9???????? }
            // n = 4, score = 500
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0a000000     |     
            //   e9????????           |                     

        $sequence_9 = { 3d00005000 7605 b800005000 6a00 8d4c2418 51 50 }
            // n = 7, score = 400
            //   3d00005000           | cmp                 eax, 0x500000
            //   7605                 | jbe                 7
            //   b800005000           | mov                 eax, 0x500000
            //   6a00                 | push                0
            //   8d4c2418             | lea                 ecx, [esp + 0x18]
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_10 = { ff75f8 ff15???????? 85c0 7508 6a01 ff15???????? }
            // n = 6, score = 400
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0xa
            //   6a01                 | push                1
            //   ff15????????         |                     

        $sequence_11 = { 83ffff 7407 57 ff15???????? 5f 5e 5b }
            // n = 7, score = 400
            //   83ffff               | cmp                 edi, -1
            //   7407                 | je                  9
            //   57                   | push                edi
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_12 = { 7508 6a01 ff15???????? 6aff 8d45fc 50 }
            // n = 6, score = 400
            //   7508                 | jne                 0xa
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   6aff                 | push                -1
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

        $sequence_13 = { 55 8bec 8b4d08 e8???????? 6a00 ff15???????? 33c0 }
            // n = 7, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_14 = { 85f6 75ef 6aff 6a01 }
            // n = 4, score = 400
            //   85f6                 | test                esi, esi
            //   75ef                 | jne                 0xfffffff1
            //   6aff                 | push                -1
            //   6a01                 | push                1

        $sequence_15 = { ffd0 85c0 7519 c705????????0a000000 }
            // n = 4, score = 400
            //   ffd0                 | jne                 0x13
            //   85c0                 | call                eax
            //   7519                 | test                eax, eax
            //   c705????????0a000000     |     

        $sequence_16 = { 6a03 68000000c0 ff7608 ff15???????? }
            // n = 4, score = 400
            //   6a03                 | push                3
            //   68000000c0           | push                0xc0000000
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff15????????         |                     

        $sequence_17 = { 780e 7f07 3d00005000 7605 }
            // n = 4, score = 400
            //   780e                 | js                  0x10
            //   7f07                 | jg                  9
            //   3d00005000           | cmp                 eax, 0x500000
            //   7605                 | jbe                 7

        $sequence_18 = { 4c8bbc24800a0000 4c8bb424780a0000 488b8d40090000 4833cc e8???????? }
            // n = 5, score = 300
            //   4c8bbc24800a0000     | dec                 esp
            //   4c8bb424780a0000     | mov                 edi, dword ptr [esp + 0xa80]
            //   488b8d40090000       | dec                 esp
            //   4833cc               | mov                 esi, dword ptr [esp + 0xa78]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 520192
}