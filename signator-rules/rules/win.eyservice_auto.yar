rule win_eyservice_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.eyservice."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.eyservice"
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
        $sequence_0 = { 83c51c 55 8bcb e8???????? 83f801 0f873cffffff 8b5634 }
            // n = 7, score = 100
            //   83c51c               | add                 ebp, 0x1c
            //   55                   | push                ebp
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   83f801               | cmp                 eax, 1
            //   0f873cffffff         | ja                  0xffffff42
            //   8b5634               | mov                 edx, dword ptr [esi + 0x34]

        $sequence_1 = { 8b44241c 50 ff15???????? 85c0 7510 c7450001000000 }
            // n = 6, score = 100
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12
            //   c7450001000000       | mov                 dword ptr [ebp], 1

        $sequence_2 = { 7509 b802000000 5e c20400 57 8dbe04010000 57 }
            // n = 7, score = 100
            //   7509                 | jne                 0xb
            //   b802000000           | mov                 eax, 2
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   57                   | push                edi
            //   8dbe04010000         | lea                 edi, [esi + 0x104]
            //   57                   | push                edi

        $sequence_3 = { 83fa0c 0f8793000000 0fb692bc844000 ff2495a8844000 56 e8???????? 894610 }
            // n = 7, score = 100
            //   83fa0c               | cmp                 edx, 0xc
            //   0f8793000000         | ja                  0x99
            //   0fb692bc844000       | movzx               edx, byte ptr [edx + 0x4084bc]
            //   ff2495a8844000       | jmp                 dword ptr [edx*4 + 0x4084a8]
            //   56                   | push                esi
            //   e8????????           |                     
            //   894610               | mov                 dword ptr [esi + 0x10], eax

        $sequence_4 = { 50 51 eb09 8b54240c 8b4610 52 50 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   eb09                 | jmp                 0xb
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_5 = { 6aff 50 e8???????? 8bf0 85f6 75a2 }
            // n = 6, score = 100
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   75a2                 | jne                 0xffffffa4

        $sequence_6 = { 56 8bf1 8b06 8b5010 57 8b7c2410 8b1f }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8b5010               | mov                 edx, dword ptr [eax + 0x10]
            //   57                   | push                edi
            //   8b7c2410             | mov                 edi, dword ptr [esp + 0x10]
            //   8b1f                 | mov                 ebx, dword ptr [edi]

        $sequence_7 = { 89442430 e8???????? 83c410 83f8ff 0f856fffffff 8b44241c }
            // n = 6, score = 100
            //   89442430             | mov                 dword ptr [esp + 0x30], eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   83f8ff               | cmp                 eax, -1
            //   0f856fffffff         | jne                 0xffffff75
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]

        $sequence_8 = { 837f18ff 750c b809000000 5f 83c428 c20c00 53 }
            // n = 7, score = 100
            //   837f18ff             | cmp                 dword ptr [edi + 0x18], -1
            //   750c                 | jne                 0xe
            //   b809000000           | mov                 eax, 9
            //   5f                   | pop                 edi
            //   83c428               | add                 esp, 0x28
            //   c20c00               | ret                 0xc
            //   53                   | push                ebx

        $sequence_9 = { 898424a2000000 8b442438 68d2040000 898424aa000000 8d5f08 ffd5 8b8c24b8200000 }
            // n = 7, score = 100
            //   898424a2000000       | mov                 dword ptr [esp + 0xa2], eax
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   68d2040000           | push                0x4d2
            //   898424aa000000       | mov                 dword ptr [esp + 0xaa], eax
            //   8d5f08               | lea                 ebx, [edi + 8]
            //   ffd5                 | call                ebp
            //   8b8c24b8200000       | mov                 ecx, dword ptr [esp + 0x20b8]

    condition:
        7 of them and filesize < 452608
}