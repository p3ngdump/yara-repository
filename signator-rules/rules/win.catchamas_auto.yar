rule win_catchamas_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.catchamas."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.catchamas"
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
        $sequence_0 = { 0f85c9000000 85db 747d 53 }
            // n = 4, score = 200
            //   0f85c9000000         | jne                 0xcf
            //   85db                 | test                ebx, ebx
            //   747d                 | je                  0x7f
            //   53                   | push                ebx

        $sequence_1 = { 6a00 51 89442428 897c2430 c684247c10000000 e8???????? 6807080000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   897c2430             | mov                 dword ptr [esp + 0x30], edi
            //   c684247c10000000     | mov                 byte ptr [esp + 0x107c], 0
            //   e8????????           |                     
            //   6807080000           | push                0x807

        $sequence_2 = { 83c40c 33c9 2bc2 8944240c }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   33c9                 | xor                 ecx, ecx
            //   2bc2                 | sub                 eax, edx
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax

        $sequence_3 = { 33c0 8d65bc 5f 5e 8b4df8 33cd }
            // n = 6, score = 200
            //   33c0                 | xor                 eax, eax
            //   8d65bc               | lea                 esp, [ebp - 0x44]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   33cd                 | xor                 ecx, ebp

        $sequence_4 = { 8bf8 8b442414 50 57 55 }
            // n = 5, score = 200
            //   8bf8                 | mov                 edi, eax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax
            //   57                   | push                edi
            //   55                   | push                ebp

        $sequence_5 = { e8???????? 83c408 85c0 0f84cb000000 8b442414 83c0f0 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f84cb000000         | je                  0xd1
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   83c0f0               | add                 eax, -0x10

        $sequence_6 = { 3b5c2410 7c86 5e 5d 57 ff15???????? ff15???????? }
            // n = 7, score = 200
            //   3b5c2410             | cmp                 ebx, dword ptr [esp + 0x10]
            //   7c86                 | jl                  0xffffff88
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   57                   | push                edi
            //   ff15????????         |                     
            //   ff15????????         |                     

        $sequence_7 = { 51 52 50 8d8c2494100000 68???????? }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   8d8c2494100000       | lea                 ecx, [esp + 0x1094]
            //   68????????           |                     

        $sequence_8 = { 57 ff15???????? 8b542408 52 6a00 }
            // n = 5, score = 200
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_9 = { ff15???????? 83c42c eb24 8b4c2418 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   83c42c               | add                 esp, 0x2c
            //   eb24                 | jmp                 0x26
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]

    condition:
        7 of them and filesize < 368640
}