rule win_classfon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.classfon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.classfon"
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
        $sequence_0 = { 8bf0 8975e0 85f6 7518 }
            // n = 4, score = 200
            //   8bf0                 | mov                 esi, eax
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   85f6                 | test                esi, esi
            //   7518                 | jne                 0x1a

        $sequence_1 = { f3a5 68???????? e8???????? 81c48c030000 5f 5e }
            // n = 6, score = 200
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   68????????           |                     
            //   e8????????           |                     
            //   81c48c030000         | add                 esp, 0x38c
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_2 = { 52 ff15???????? b9e1000000 33c0 8dbc244d040000 889c244c040000 f3ab }
            // n = 7, score = 200
            //   52                   | push                edx
            //   ff15????????         |                     
            //   b9e1000000           | mov                 ecx, 0xe1
            //   33c0                 | xor                 eax, eax
            //   8dbc244d040000       | lea                 edi, [esp + 0x44d]
            //   889c244c040000       | mov                 byte ptr [esp + 0x44c], bl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_3 = { 5e 5b 81c418020000 c3 5f 5e 33c0 }
            // n = 7, score = 200
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   81c418020000         | add                 esp, 0x218
            //   c3                   | ret                 
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { 51 ff15???????? 33db a3???????? 3bc3 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   33db                 | xor                 ebx, ebx
            //   a3????????           |                     
            //   3bc3                 | cmp                 eax, ebx

        $sequence_5 = { ff15???????? 5e c3 83ec08 56 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   83ec08               | sub                 esp, 8
            //   56                   | push                esi

        $sequence_6 = { 68???????? 68???????? 6802000080 e8???????? a1???????? 83c410 }
            // n = 6, score = 200
            //   68????????           |                     
            //   68????????           |                     
            //   6802000080           | push                0x80000002
            //   e8????????           |                     
            //   a1????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_7 = { 51 6a00 52 50 ff15???????? 8b4c2404 }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]

        $sequence_8 = { 8bf0 56 ffd3 8b442410 8b3d???????? }
            // n = 5, score = 200
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8b3d????????         |                     

        $sequence_9 = { ff15???????? 8b542410 8bf0 52 ff15???????? 3bf5 896c2410 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   8bf0                 | mov                 esi, eax
            //   52                   | push                edx
            //   ff15????????         |                     
            //   3bf5                 | cmp                 esi, ebp
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp

    condition:
        7 of them and filesize < 73728
}