rule win_dmsniff_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dmsniff."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dmsniff"
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
        $sequence_0 = { 55 89e5 53 56 57 6a00 6880000000 }
            // n = 7, score = 400
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a00                 | push                0
            //   6880000000           | push                0x80

        $sequence_1 = { 7509 c745b410000000 eb3b a1???????? }
            // n = 4, score = 400
            //   7509                 | jne                 0xb
            //   c745b410000000       | mov                 dword ptr [ebp - 0x4c], 0x10
            //   eb3b                 | jmp                 0x3d
            //   a1????????           |                     

        $sequence_2 = { 83c661 89f3 881d???????? b807000000 }
            // n = 4, score = 400
            //   83c661               | add                 esi, 0x61
            //   89f3                 | mov                 ebx, esi
            //   881d????????         |                     
            //   b807000000           | mov                 eax, 7

        $sequence_3 = { e8???????? 83c410 3dffff0000 0f85d2060000 }
            // n = 4, score = 400
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   3dffff0000           | cmp                 eax, 0xffff
            //   0f85d2060000         | jne                 0x6d8

        $sequence_4 = { e8???????? 83c41c 89c7 09ff 7504 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   89c7                 | mov                 edi, eax
            //   09ff                 | or                  edi, edi
            //   7504                 | jne                 6

        $sequence_5 = { 8b5d0c 8b7510 ff7508 e8???????? 89c7 6a00 }
            // n = 6, score = 400
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   89c7                 | mov                 edi, eax
            //   6a00                 | push                0

        $sequence_6 = { 3dffff0000 0f85fe040000 68???????? e8???????? 6a01 50 }
            // n = 6, score = 400
            //   3dffff0000           | cmp                 eax, 0xffff
            //   0f85fe040000         | jne                 0x504
            //   68????????           |                     
            //   e8????????           |                     
            //   6a01                 | push                1
            //   50                   | push                eax

        $sequence_7 = { 59 50 ff15???????? a3???????? 85c0 7517 }
            // n = 6, score = 400
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7517                 | jne                 0x19

        $sequence_8 = { 83c410 3dffff0000 0f85ab060000 68???????? }
            // n = 4, score = 400
            //   83c410               | add                 esp, 0x10
            //   3dffff0000           | cmp                 eax, 0xffff
            //   0f85ab060000         | jne                 0x6b1
            //   68????????           |                     

        $sequence_9 = { 50 ff15???????? a3???????? 85c0 7517 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7517                 | jne                 0x19

    condition:
        7 of them and filesize < 131072
}