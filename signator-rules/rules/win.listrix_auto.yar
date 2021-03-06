rule win_listrix_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.listrix."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.listrix"
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
        $sequence_0 = { 50 ff15???????? 8b7518 85f6 7f06 0f89dd000000 8d8d94f5ffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b7518               | mov                 esi, dword ptr [ebp + 0x18]
            //   85f6                 | test                esi, esi
            //   7f06                 | jg                  8
            //   0f89dd000000         | jns                 0xe3
            //   8d8d94f5ffff         | lea                 ecx, [ebp - 0xa6c]

        $sequence_1 = { 68???????? 51 ff15???????? 83c424 8d95f4fbffff }
            // n = 5, score = 100
            //   68????????           |                     
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c424               | add                 esp, 0x24
            //   8d95f4fbffff         | lea                 edx, [ebp - 0x40c]

        $sequence_2 = { e8???????? 83c414 8b9d90f5ffff 8d9594f5ffff }
            // n = 4, score = 100
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8b9d90f5ffff         | mov                 ebx, dword ptr [ebp - 0xa70]
            //   8d9594f5ffff         | lea                 edx, [ebp - 0xa6c]

        $sequence_3 = { 8b35???????? 57 68ff000000 8d85f4fdffff }
            // n = 4, score = 100
            //   8b35????????         |                     
            //   57                   | push                edi
            //   68ff000000           | push                0xff
            //   8d85f4fdffff         | lea                 eax, [ebp - 0x20c]

        $sequence_4 = { 0f84ac010000 8b1d???????? 68???????? 8d85c0f5ffff }
            // n = 4, score = 100
            //   0f84ac010000         | je                  0x1b2
            //   8b1d????????         |                     
            //   68????????           |                     
            //   8d85c0f5ffff         | lea                 eax, [ebp - 0xa40]

        $sequence_5 = { 51 ff15???????? 83c424 8d95f4fbffff }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c424               | add                 esp, 0x24
            //   8d95f4fbffff         | lea                 edx, [ebp - 0x40c]

        $sequence_6 = { 68???????? 8d8dc0f5ffff 51 ffd3 }
            // n = 4, score = 100
            //   68????????           |                     
            //   8d8dc0f5ffff         | lea                 ecx, [ebp - 0xa40]
            //   51                   | push                ecx
            //   ffd3                 | call                ebx

        $sequence_7 = { 6806020000 52 8d85eefbffff 50 668995ecfbffff e8???????? }
            // n = 6, score = 100
            //   6806020000           | push                0x206
            //   52                   | push                edx
            //   8d85eefbffff         | lea                 eax, [ebp - 0x412]
            //   50                   | push                eax
            //   668995ecfbffff       | mov                 word ptr [ebp - 0x414], dx
            //   e8????????           |                     

        $sequence_8 = { 0f8503ffffff 8b35???????? 68???????? 68???????? ff15???????? 68dc050000 }
            // n = 6, score = 100
            //   0f8503ffffff         | jne                 0xffffff09
            //   8b35????????         |                     
            //   68????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   68dc050000           | push                0x5dc

        $sequence_9 = { 7229 f3a5 ff2495604b4000 8bc7 ba03000000 }
            // n = 5, score = 100
            //   7229                 | jb                  0x2b
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff2495604b4000       | jmp                 dword ptr [edx*4 + 0x404b60]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3

    condition:
        7 of them and filesize < 106496
}