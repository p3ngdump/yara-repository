rule win_glitch_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.glitch_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.glitch_pos"
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
        $sequence_0 = { 6a00 6a40 8d45b0 50 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   6a40                 | push                0x40
            //   8d45b0               | lea                 eax, [ebp - 0x50]
            //   50                   | push                eax

        $sequence_1 = { e8???????? 50 8b856cffffff 8b00 ffb56cffffff ff5054 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   8b856cffffff         | mov                 eax, dword ptr [ebp - 0x94]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ffb56cffffff         | push                dword ptr [ebp - 0x94]
            //   ff5054               | call                dword ptr [eax + 0x54]

        $sequence_2 = { e8???????? 50 e8???????? 668985f0feffff 8d8568ffffff }
            // n = 5, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   668985f0feffff       | mov                 word ptr [ebp - 0x110], ax
            //   8d8568ffffff         | lea                 eax, [ebp - 0x98]

        $sequence_3 = { 8b4508 8b00 ff7508 ff901c030000 50 8d45d8 50 }
            // n = 7, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff901c030000         | call                dword ptr [eax + 0x31c]
            //   50                   | push                eax
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   50                   | push                eax

        $sequence_4 = { 8d45a0 50 e8???????? 83c410 50 e8???????? }
            // n = 6, score = 100
            //   8d45a0               | lea                 eax, [ebp - 0x60]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 8d45bc 50 8b4508 8b00 ff7508 ff90f8060000 898504ffffff }
            // n = 7, score = 100
            //   8d45bc               | lea                 eax, [ebp - 0x44]
            //   50                   | push                eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff90f8060000         | call                dword ptr [eax + 0x6f8]
            //   898504ffffff         | mov                 dword ptr [ebp - 0xfc], eax

        $sequence_6 = { 50 8d85b4feffff 50 8d45ac }
            // n = 4, score = 100
            //   50                   | push                eax
            //   8d85b4feffff         | lea                 eax, [ebp - 0x14c]
            //   50                   | push                eax
            //   8d45ac               | lea                 eax, [ebp - 0x54]

        $sequence_7 = { dbe2 898558ffffff 83bd58ffffff00 7d20 6a70 68???????? ffb55cffffff }
            // n = 7, score = 100
            //   dbe2                 | fnclex              
            //   898558ffffff         | mov                 dword ptr [ebp - 0xa8], eax
            //   83bd58ffffff00       | cmp                 dword ptr [ebp - 0xa8], 0
            //   7d20                 | jge                 0x22
            //   6a70                 | push                0x70
            //   68????????           |                     
            //   ffb55cffffff         | push                dword ptr [ebp - 0xa4]

        $sequence_8 = { eb07 83a538feffff00 6a0a 6a0a d985f8feffff e8???????? 50 }
            // n = 7, score = 100
            //   eb07                 | jmp                 9
            //   83a538feffff00       | and                 dword ptr [ebp - 0x1c8], 0
            //   6a0a                 | push                0xa
            //   6a0a                 | push                0xa
            //   d985f8feffff         | fld                 dword ptr [ebp - 0x108]
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_9 = { 8bec 83ec0c 68???????? 64a100000000 50 64892500000000 b8bc000000 }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   68????????           |                     
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   b8bc000000           | mov                 eax, 0xbc

    condition:
        7 of them and filesize < 1024000
}