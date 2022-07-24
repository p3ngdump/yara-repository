rule win_hermeticwiper_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.hermeticwiper."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hermeticwiper"
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
        $sequence_0 = { 74be 8b472c 33d2 f7f1 }
            // n = 4, score = 200
            //   74be                 | je                  0xffffffc0
            //   8b472c               | mov                 eax, dword ptr [edi + 0x2c]
            //   33d2                 | xor                 edx, edx
            //   f7f1                 | div                 ecx

        $sequence_1 = { ff770c 8d5710 894c244c 8b7f08 89542430 8d54245c }
            // n = 6, score = 200
            //   ff770c               | push                dword ptr [edi + 0xc]
            //   8d5710               | lea                 edx, [edi + 0x10]
            //   894c244c             | mov                 dword ptr [esp + 0x4c], ecx
            //   8b7f08               | mov                 edi, dword ptr [edi + 8]
            //   89542430             | mov                 dword ptr [esp + 0x30], edx
            //   8d54245c             | lea                 edx, [esp + 0x5c]

        $sequence_2 = { 5b 8be5 5d c20400 83c702 8bcf }
            // n = 6, score = 200
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   83c702               | add                 edi, 2
            //   8bcf                 | mov                 ecx, edi

        $sequence_3 = { ffd7 85c0 7527 8b4e56 8b4652 894c2418 8d4c2414 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7527                 | jne                 0x29
            //   8b4e56               | mov                 ecx, dword ptr [esi + 0x56]
            //   8b4652               | mov                 eax, dword ptr [esi + 0x52]
            //   894c2418             | mov                 dword ptr [esp + 0x18], ecx
            //   8d4c2414             | lea                 ecx, [esp + 0x14]

        $sequence_4 = { 0f88bf000000 68???????? 8d8578fcffff 50 ff15???????? 6802100000 8d8568fbffff }
            // n = 7, score = 200
            //   0f88bf000000         | js                  0xc5
            //   68????????           |                     
            //   8d8578fcffff         | lea                 eax, [ebp - 0x388]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6802100000           | push                0x1002
            //   8d8568fbffff         | lea                 eax, [ebp - 0x498]

        $sequence_5 = { 8bc3 5b 8be5 5d c3 6a16 }
            // n = 6, score = 200
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a16                 | push                0x16

        $sequence_6 = { 83c408 897dfc eb18 ff750c 8d8590fdffff 50 53 }
            // n = 7, score = 200
            //   83c408               | add                 esp, 8
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   eb18                 | jmp                 0x1a
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d8590fdffff         | lea                 eax, [ebp - 0x270]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_7 = { 50 6803000080 ffd7 85c0 7552 8945fc 8d45fc }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6803000080           | push                0x80000003
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7552                 | jne                 0x54
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_8 = { 50 6868000900 ff7728 ff15???????? 85c0 7519 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   6868000900           | push                0x90068
            //   ff7728               | push                dword ptr [edi + 0x28]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7519                 | jne                 0x1b

        $sequence_9 = { ffd3 8d45fc c745fc00000000 50 68???????? }
            // n = 5, score = 200
            //   ffd3                 | call                ebx
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   50                   | push                eax
            //   68????????           |                     

    condition:
        7 of them and filesize < 247808
}