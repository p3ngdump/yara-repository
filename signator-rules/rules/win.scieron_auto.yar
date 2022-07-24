rule win_scieron_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.scieron."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.scieron"
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
        $sequence_0 = { 8b4d10 8901 746c 50 }
            // n = 4, score = 100
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   746c                 | je                  0x6e
            //   50                   | push                eax

        $sequence_1 = { 8d85d4fdffff 50 ff15???????? 6a00 6a02 89b5d4fdffff e8???????? }
            // n = 7, score = 100
            //   8d85d4fdffff         | lea                 eax, [ebp - 0x22c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   89b5d4fdffff         | mov                 dword ptr [ebp - 0x22c], esi
            //   e8????????           |                     

        $sequence_2 = { 7475 817c2410c8000000 756b 33c0 40 5f }
            // n = 6, score = 100
            //   7475                 | je                  0x77
            //   817c2410c8000000     | cmp                 dword ptr [esp + 0x10], 0xc8
            //   756b                 | jne                 0x6d
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5f                   | pop                 edi

        $sequence_3 = { 8bd8 83c410 85db 0f84c8fbffff }
            // n = 4, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   83c410               | add                 esp, 0x10
            //   85db                 | test                ebx, ebx
            //   0f84c8fbffff         | je                  0xfffffbce

        $sequence_4 = { 33c0 ebeb 55 8bec 83ec54 53 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   ebeb                 | jmp                 0xffffffed
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec54               | sub                 esp, 0x54
            //   53                   | push                ebx

        $sequence_5 = { 8d4c2410 51 6a05 50 68???????? }
            // n = 5, score = 100
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   51                   | push                ecx
            //   6a05                 | push                5
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_6 = { 85c0 0f8485000000 8b842420020000 833800 751a }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   0f8485000000         | je                  0x8b
            //   8b842420020000       | mov                 eax, dword ptr [esp + 0x220]
            //   833800               | cmp                 dword ptr [eax], 0
            //   751a                 | jne                 0x1c

        $sequence_7 = { ebf5 55 8bec 83ec14 56 }
            // n = 5, score = 100
            //   ebf5                 | jmp                 0xfffffff7
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec14               | sub                 esp, 0x14
            //   56                   | push                esi

        $sequence_8 = { ff7604 8d443c30 50 ffd3 ff7604 033e }
            // n = 6, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   8d443c30             | lea                 eax, [esp + edi + 0x30]
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   ff7604               | push                dword ptr [esi + 4]
            //   033e                 | add                 edi, dword ptr [esi]

        $sequence_9 = { 6a03 e8???????? 8bf8 83c410 85ff 7432 8b450c }
            // n = 7, score = 100
            //   6a03                 | push                3
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c410               | add                 esp, 0x10
            //   85ff                 | test                edi, edi
            //   7432                 | je                  0x34
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 100352
}