rule win_bka_trojaner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bka_trojaner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bka_trojaner"
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
        $sequence_0 = { 81fb00010000 7415 81fb01010000 740d 81fb02010000 }
            // n = 5, score = 100
            //   81fb00010000         | cmp                 ebx, 0x100
            //   7415                 | je                  0x17
            //   81fb01010000         | cmp                 ebx, 0x101
            //   740d                 | je                  0xf
            //   81fb02010000         | cmp                 ebx, 0x102

        $sequence_1 = { 56 ff15???????? 837d7020 0f8550010000 8b4c2428 0faf4c2424 8b454c }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   837d7020             | cmp                 dword ptr [ebp + 0x70], 0x20
            //   0f8550010000         | jne                 0x156
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   0faf4c2424           | imul                ecx, dword ptr [esp + 0x24]
            //   8b454c               | mov                 eax, dword ptr [ebp + 0x4c]

        $sequence_2 = { 8b08 56 52 50 ff510c 8bf0 }
            // n = 6, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   56                   | push                esi
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff510c               | call                dword ptr [ecx + 0xc]
            //   8bf0                 | mov                 esi, eax

        $sequence_3 = { 8d8878ffffff 85c9 7504 33d2 eb3b 8b907cffffff 8b4a08 }
            // n = 7, score = 100
            //   8d8878ffffff         | lea                 ecx, [eax - 0x88]
            //   85c9                 | test                ecx, ecx
            //   7504                 | jne                 6
            //   33d2                 | xor                 edx, edx
            //   eb3b                 | jmp                 0x3d
            //   8b907cffffff         | mov                 edx, dword ptr [eax - 0x84]
            //   8b4a08               | mov                 ecx, dword ptr [edx + 8]

        $sequence_4 = { bf20059319 7579 8b4314 3bc7 7407 3d21059319 756b }
            // n = 7, score = 100
            //   bf20059319           | mov                 edi, 0x19930520
            //   7579                 | jne                 0x7b
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]
            //   3bc7                 | cmp                 eax, edi
            //   7407                 | je                  9
            //   3d21059319           | cmp                 eax, 0x19930521
            //   756b                 | jne                 0x6d

        $sequence_5 = { 898588000000 33d2 57 33c0 3b0cc5b0e14000 }
            // n = 5, score = 100
            //   898588000000         | mov                 dword ptr [ebp + 0x88], eax
            //   33d2                 | xor                 edx, edx
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax
            //   3b0cc5b0e14000       | cmp                 ecx, dword ptr [eax*8 + 0x40e1b0]

        $sequence_6 = { ff5124 85c0 7517 8b44247c 5f }
            // n = 5, score = 100
            //   ff5124               | call                dword ptr [ecx + 0x24]
            //   85c0                 | test                eax, eax
            //   7517                 | jne                 0x19
            //   8b44247c             | mov                 eax, dword ptr [esp + 0x7c]
            //   5f                   | pop                 edi

        $sequence_7 = { 89842460080000 8d442420 50 68???????? 68???????? 33db 56 }
            // n = 7, score = 100
            //   89842460080000       | mov                 dword ptr [esp + 0x860], eax
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   50                   | push                eax
            //   68????????           |                     
            //   68????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   56                   | push                esi

        $sequence_8 = { c3 8325????????00 e9???????? 6a10 68???????? e8???????? }
            // n = 6, score = 100
            //   c3                   | ret                 
            //   8325????????00       |                     
            //   e9????????           |                     
            //   6a10                 | push                0x10
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_9 = { 57 0f868a000000 8b3e 8b07 8b4d14 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   0f868a000000         | jbe                 0x90
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

    condition:
        7 of them and filesize < 221184
}