rule win_cryptoluck_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.cryptoluck."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cryptoluck"
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
        $sequence_0 = { 8d55d0 52 8b45d8 50 8b4dd4 51 }
            // n = 6, score = 100
            //   8d55d0               | lea                 edx, [ebp - 0x30]
            //   52                   | push                edx
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   50                   | push                eax
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   51                   | push                ecx

        $sequence_1 = { 8915???????? c705????????01000000 eb0a c705????????00000000 }
            // n = 4, score = 100
            //   8915????????         |                     
            //   c705????????01000000     |     
            //   eb0a                 | jmp                 0xc
            //   c705????????00000000     |     

        $sequence_2 = { ff15???????? 8b95d8fbffff 52 ff15???????? 83bdd0fbffff00 7636 8b85d0fbffff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b95d8fbffff         | mov                 edx, dword ptr [ebp - 0x428]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83bdd0fbffff00       | cmp                 dword ptr [ebp - 0x430], 0
            //   7636                 | jbe                 0x38
            //   8b85d0fbffff         | mov                 eax, dword ptr [ebp - 0x430]

        $sequence_3 = { 8d45f8 50 8d4df4 51 8d55fc }
            // n = 5, score = 100
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   8d4df4               | lea                 ecx, [ebp - 0xc]
            //   51                   | push                ecx
            //   8d55fc               | lea                 edx, [ebp - 4]

        $sequence_4 = { 50 8b4df8 51 e8???????? 83c408 8945f8 8b55d0 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b55d0               | mov                 edx, dword ptr [ebp - 0x30]

        $sequence_5 = { 8b45f8 00eb 4b 80383b 7440 830065 0800 }
            // n = 7, score = 100
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   00eb                 | add                 bl, ch
            //   4b                   | dec                 ebx
            //   80383b               | cmp                 byte ptr [eax], 0x3b
            //   7440                 | je                  0x42
            //   830065               | add                 dword ptr [eax], 0x65
            //   0800                 | or                  byte ptr [eax], al

        $sequence_6 = { 83c40c 898508f9ffff 8b8508f9ffff 50 68???????? 8d8de4fbffff 51 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   898508f9ffff         | mov                 dword ptr [ebp - 0x6f8], eax
            //   8b8508f9ffff         | mov                 eax, dword ptr [ebp - 0x6f8]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d8de4fbffff         | lea                 ecx, [ebp - 0x41c]
            //   51                   | push                ecx

        $sequence_7 = { 0345f0 8945c4 8b4dc4 894dc8 837dc000 741a 8b55c8 }
            // n = 7, score = 100
            //   0345f0               | add                 eax, dword ptr [ebp - 0x10]
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   8b4dc4               | mov                 ecx, dword ptr [ebp - 0x3c]
            //   894dc8               | mov                 dword ptr [ebp - 0x38], ecx
            //   837dc000             | cmp                 dword ptr [ebp - 0x40], 0
            //   741a                 | je                  0x1c
            //   8b55c8               | mov                 edx, dword ptr [ebp - 0x38]

        $sequence_8 = { eb0f 8b95acfeffff 83c201 8995acfeffff 8b85acfeffff 3b05???????? 7d2d }
            // n = 7, score = 100
            //   eb0f                 | jmp                 0x11
            //   8b95acfeffff         | mov                 edx, dword ptr [ebp - 0x154]
            //   83c201               | add                 edx, 1
            //   8995acfeffff         | mov                 dword ptr [ebp - 0x154], edx
            //   8b85acfeffff         | mov                 eax, dword ptr [ebp - 0x154]
            //   3b05????????         |                     
            //   7d2d                 | jge                 0x2f

        $sequence_9 = { 6800000080 68???????? ff15???????? 8985d8fbffff 83bdd8fbffffff 0f84b6000000 6a00 }
            // n = 7, score = 100
            //   6800000080           | push                0x80000000
            //   68????????           |                     
            //   ff15????????         |                     
            //   8985d8fbffff         | mov                 dword ptr [ebp - 0x428], eax
            //   83bdd8fbffffff       | cmp                 dword ptr [ebp - 0x428], -1
            //   0f84b6000000         | je                  0xbc
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 229376
}