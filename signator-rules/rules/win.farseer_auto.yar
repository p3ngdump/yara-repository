rule win_farseer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.farseer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.farseer"
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
        $sequence_0 = { 7531 e8???????? 33c0 3b6810 }
            // n = 4, score = 100
            //   7531                 | jne                 0x33
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   3b6810               | cmp                 ebp, dword ptr [eax + 0x10]

        $sequence_1 = { 8b44242c 3bc3 741e 8b4c241c 8b7c2430 51 e8???????? }
            // n = 7, score = 100
            //   8b44242c             | mov                 eax, dword ptr [esp + 0x2c]
            //   3bc3                 | cmp                 eax, ebx
            //   741e                 | je                  0x20
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   8b7c2430             | mov                 edi, dword ptr [esp + 0x30]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_2 = { 52 8bd8 e8???????? 83c404 891d???????? 5f }
            // n = 6, score = 100
            //   52                   | push                edx
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   891d????????         |                     
            //   5f                   | pop                 edi

        $sequence_3 = { 8bc8 83e01f c1f905 8b0c8d20634200 }
            // n = 4, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d20634200       | mov                 ecx, dword ptr [ecx*4 + 0x426320]

        $sequence_4 = { 51 c78424a000000002000000 e8???????? 68???????? 8d542450 52 }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   c78424a000000002000000     | mov    dword ptr [esp + 0xa0], 2
            //   e8????????           |                     
            //   68????????           |                     
            //   8d542450             | lea                 edx, [esp + 0x50]
            //   52                   | push                edx

        $sequence_5 = { ff15???????? 57 8d5c2408 e8???????? 8b8c2414030000 83c404 5b }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   57                   | push                edi
            //   8d5c2408             | lea                 ebx, [esp + 8]
            //   e8????????           |                     
            //   8b8c2414030000       | mov                 ecx, dword ptr [esp + 0x314]
            //   83c404               | add                 esp, 4
            //   5b                   | pop                 ebx

        $sequence_6 = { 399c24e4020000 0f826a020000 8b8424d0020000 50 e9???????? e8???????? }
            // n = 6, score = 100
            //   399c24e4020000       | cmp                 dword ptr [esp + 0x2e4], ebx
            //   0f826a020000         | jb                  0x270
            //   8b8424d0020000       | mov                 eax, dword ptr [esp + 0x2d0]
            //   50                   | push                eax
            //   e9????????           |                     
            //   e8????????           |                     

        $sequence_7 = { 33c0 8d4900 8074043032 40 3d40020000 72f3 8b3d???????? }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   8d4900               | lea                 ecx, [ecx]
            //   8074043032           | xor                 byte ptr [esp + eax + 0x30], 0x32
            //   40                   | inc                 eax
            //   3d40020000           | cmp                 eax, 0x240
            //   72f3                 | jb                  0xfffffff5
            //   8b3d????????         |                     

        $sequence_8 = { 837c245010 0f8296000000 8b4c243c 51 e9???????? }
            // n = 5, score = 100
            //   837c245010           | cmp                 dword ptr [esp + 0x50], 0x10
            //   0f8296000000         | jb                  0x9c
            //   8b4c243c             | mov                 ecx, dword ptr [esp + 0x3c]
            //   51                   | push                ecx
            //   e9????????           |                     

        $sequence_9 = { 890e 8b0d???????? 895604 668b15???????? 894608 a0???????? }
            // n = 6, score = 100
            //   890e                 | mov                 dword ptr [esi], ecx
            //   8b0d????????         |                     
            //   895604               | mov                 dword ptr [esi + 4], edx
            //   668b15????????       |                     
            //   894608               | mov                 dword ptr [esi + 8], eax
            //   a0????????           |                     

    condition:
        7 of them and filesize < 347328
}