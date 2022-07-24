rule win_sodamaster_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.sodamaster."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sodamaster"
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
        $sequence_0 = { c745d06c002000 c745d46e006f00 c745d820006500 c745dc72007200 33c9 66894de0 56 }
            // n = 7, score = 100
            //   c745d06c002000       | mov                 dword ptr [ebp - 0x30], 0x20006c
            //   c745d46e006f00       | mov                 dword ptr [ebp - 0x2c], 0x6f006e
            //   c745d820006500       | mov                 dword ptr [ebp - 0x28], 0x650020
            //   c745dc72007200       | mov                 dword ptr [ebp - 0x24], 0x720072
            //   33c9                 | xor                 ecx, ecx
            //   66894de0             | mov                 word ptr [ebp - 0x20], cx
            //   56                   | push                esi

        $sequence_1 = { 7418 8b4d08 51 8b4d0c e8???????? }
            // n = 5, score = 100
            //   7418                 | je                  0x1a
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   e8????????           |                     

        $sequence_2 = { 83e103 f3a4 8d8d24ffffff 51 ff15???????? 8d8524ffffff }
            // n = 6, score = 100
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d8d24ffffff         | lea                 ecx, [ebp - 0xdc]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8d8524ffffff         | lea                 eax, [ebp - 0xdc]

        $sequence_3 = { 8b4db8 51 ff15???????? 83c410 8b4df0 }
            // n = 5, score = 100
            //   8b4db8               | mov                 ecx, dword ptr [ebp - 0x48]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]

        $sequence_4 = { 50 6a2b 53 c78514fbffffd6000000 ffd7 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   6a2b                 | push                0x2b
            //   53                   | push                ebx
            //   c78514fbffffd6000000     | mov    dword ptr [ebp - 0x4ec], 0xd6
            //   ffd7                 | call                edi

        $sequence_5 = { 33ff ffb740030110 ff15???????? 898740030110 83c704 83ff28 }
            // n = 6, score = 100
            //   33ff                 | xor                 edi, edi
            //   ffb740030110         | push                dword ptr [edi + 0x10010340]
            //   ff15????????         |                     
            //   898740030110         | mov                 dword ptr [edi + 0x10010340], eax
            //   83c704               | add                 edi, 4
            //   83ff28               | cmp                 edi, 0x28

        $sequence_6 = { 8bec 33c0 8b4d08 3b0cc5d0ca0010 740a 40 }
            // n = 6, score = 100
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   3b0cc5d0ca0010       | cmp                 ecx, dword ptr [eax*8 + 0x1000cad0]
            //   740a                 | je                  0xc
            //   40                   | inc                 eax

        $sequence_7 = { 50 6a1f 53 ffd7 33c0 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   6a1f                 | push                0x1f
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   33c0                 | xor                 eax, eax

        $sequence_8 = { 030495a0330110 eb05 b8???????? f6400420 7415 53 6a00 }
            // n = 7, score = 100
            //   030495a0330110       | add                 eax, dword ptr [edx*4 + 0x100133a0]
            //   eb05                 | jmp                 7
            //   b8????????           |                     
            //   f6400420             | test                byte ptr [eax + 4], 0x20
            //   7415                 | je                  0x17
            //   53                   | push                ebx
            //   6a00                 | push                0

        $sequence_9 = { 85c0 745b 8b8df4efffff 8bf1 33c0 d1ee }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   745b                 | je                  0x5d
            //   8b8df4efffff         | mov                 ecx, dword ptr [ebp - 0x100c]
            //   8bf1                 | mov                 esi, ecx
            //   33c0                 | xor                 eax, eax
            //   d1ee                 | shr                 esi, 1

    condition:
        7 of them and filesize < 134144
}