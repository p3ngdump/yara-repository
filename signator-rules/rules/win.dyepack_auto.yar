rule win_dyepack_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dyepack."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dyepack"
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
        $sequence_0 = { 13fb 3bf8 7cb2 7f08 8b4c2410 3be9 }
            // n = 6, score = 300
            //   13fb                 | adc                 edi, ebx
            //   3bf8                 | cmp                 edi, eax
            //   7cb2                 | jl                  0xffffffb4
            //   7f08                 | jg                  0xa
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   3be9                 | cmp                 ebp, ecx

        $sequence_1 = { ff15???????? 85c0 741e 8b442418 3bc3 }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   3bc3                 | cmp                 eax, ebx

        $sequence_2 = { 53 52 8d44242c 51 50 56 ff15???????? }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   52                   | push                edx
            //   8d44242c             | lea                 eax, [esp + 0x2c]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_3 = { 6a03 53 aa 8b842434100000 }
            // n = 4, score = 300
            //   6a03                 | push                3
            //   53                   | push                ebx
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8b842434100000       | mov                 eax, dword ptr [esp + 0x1034]

        $sequence_4 = { 760b b900100000 895c2420 eb04 89442420 8d542418 53 }
            // n = 7, score = 300
            //   760b                 | jbe                 0xd
            //   b900100000           | mov                 ecx, 0x1000
            //   895c2420             | mov                 dword ptr [esp + 0x20], ebx
            //   eb04                 | jmp                 6
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   53                   | push                ebx

        $sequence_5 = { eb04 8b4c2410 2bcd 1bc7 7815 }
            // n = 5, score = 300
            //   eb04                 | jmp                 6
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   2bcd                 | sub                 ecx, ebp
            //   1bc7                 | sbb                 eax, edi
            //   7815                 | js                  0x17

        $sequence_6 = { eb04 8b4c2410 2bcd 1bc7 7815 7f08 81f900100000 }
            // n = 7, score = 300
            //   eb04                 | jmp                 6
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   2bcd                 | sub                 ecx, ebp
            //   1bc7                 | sbb                 eax, edi
            //   7815                 | js                  0x17
            //   7f08                 | jg                  0xa
            //   81f900100000         | cmp                 ecx, 0x1000

        $sequence_7 = { 8d4c2418 53 51 8d54242c 6a01 52 }
            // n = 6, score = 300
            //   8d4c2418             | lea                 ecx, [esp + 0x18]
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   8d54242c             | lea                 edx, [esp + 0x2c]
            //   6a01                 | push                1
            //   52                   | push                edx

        $sequence_8 = { 8b3d???????? 55 6a02 53 6aff 56 }
            // n = 6, score = 300
            //   8b3d????????         |                     
            //   55                   | push                ebp
            //   6a02                 | push                2
            //   53                   | push                ebx
            //   6aff                 | push                -1
            //   56                   | push                esi

        $sequence_9 = { 7416 03e8 8b442414 13fb 3bf8 }
            // n = 5, score = 300
            //   7416                 | je                  0x18
            //   03e8                 | add                 ebp, eax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   13fb                 | adc                 edi, ebx
            //   3bf8                 | cmp                 edi, eax

    condition:
        7 of them and filesize < 212992
}