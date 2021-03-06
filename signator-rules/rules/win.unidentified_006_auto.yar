rule win_unidentified_006_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_006."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_006"
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
        $sequence_0 = { ff15???????? 85c0 7504 32c0 eb42 8b4dd4 6a02 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7504                 | jne                 6
            //   32c0                 | xor                 al, al
            //   eb42                 | jmp                 0x44
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   6a02                 | push                2

        $sequence_1 = { 03c1 50 e8???????? 8945f0 59 }
            // n = 5, score = 100
            //   03c1                 | add                 eax, ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   59                   | pop                 ecx

        $sequence_2 = { 83c410 85c0 7529 8b4dfc 85c9 7422 }
            // n = 6, score = 100
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7529                 | jne                 0x2b
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   85c9                 | test                ecx, ecx
            //   7422                 | je                  0x24

        $sequence_3 = { 0f8499000000 8b4df4 3b4dfc 0f858d000000 85f6 }
            // n = 5, score = 100
            //   0f8499000000         | je                  0x9f
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   3b4dfc               | cmp                 ecx, dword ptr [ebp - 4]
            //   0f858d000000         | jne                 0x93
            //   85f6                 | test                esi, esi

        $sequence_4 = { 50 6a00 6813000020 ff75f4 ffd6 817df8c8000000 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6813000020           | push                0x20000013
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ffd6                 | call                esi
            //   817df8c8000000       | cmp                 dword ptr [ebp - 8], 0xc8

        $sequence_5 = { 668b45dc 6689470c 33c0 85f6 0f94c0 5f }
            // n = 6, score = 100
            //   668b45dc             | mov                 ax, word ptr [ebp - 0x24]
            //   6689470c             | mov                 word ptr [edi + 0xc], ax
            //   33c0                 | xor                 eax, eax
            //   85f6                 | test                esi, esi
            //   0f94c0               | sete                al
            //   5f                   | pop                 edi

        $sequence_6 = { e8???????? 8b4dfc 83c40c 8bf7 8bd7 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c40c               | add                 esp, 0xc
            //   8bf7                 | mov                 esi, edi
            //   8bd7                 | mov                 edx, edi

        $sequence_7 = { 8bf7 8bd7 85c9 7421 83ff0c 1bc0 }
            // n = 6, score = 100
            //   8bf7                 | mov                 esi, edi
            //   8bd7                 | mov                 edx, edi
            //   85c9                 | test                ecx, ecx
            //   7421                 | je                  0x23
            //   83ff0c               | cmp                 edi, 0xc
            //   1bc0                 | sbb                 eax, eax

        $sequence_8 = { 42 3bd1 72df ffd3 5f 5e }
            // n = 6, score = 100
            //   42                   | inc                 edx
            //   3bd1                 | cmp                 edx, ecx
            //   72df                 | jb                  0xffffffe1
            //   ffd3                 | call                ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_9 = { 8b45f4 83c40c 8945f8 57 }
            // n = 4, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c40c               | add                 esp, 0xc
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   57                   | push                edi

    condition:
        7 of them and filesize < 40960
}