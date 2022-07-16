rule win_obscene_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.obscene."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.obscene"
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
        $sequence_0 = { ff15???????? 3945fc 7d16 8b4508 0345fc 0fbe00 83f002 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   3945fc               | cmp                 dword ptr [ebp - 4], eax
            //   7d16                 | jge                 0x18
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0345fc               | add                 eax, dword ptr [ebp - 4]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f002               | xor                 eax, 2

        $sequence_1 = { 8bec 51 51 8d45f8 50 6a06 68f4421010 }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   6a06                 | push                6
            //   68f4421010           | push                0x101042f4

        $sequence_2 = { 8808 8b45f8 40 8945f8 8b45fc 0fbe00 8b4dfc }
            // n = 7, score = 100
            //   8808                 | mov                 byte ptr [eax], cl
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   40                   | inc                 eax
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_3 = { 8b45f8 0fbe00 83f839 7e4b }
            // n = 4, score = 100
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f839               | cmp                 eax, 0x39
            //   7e4b                 | jle                 0x4d

        $sequence_4 = { 68???????? ff15???????? 8945f4 68???????? ff75f8 ff15???????? a3???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   68????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   a3????????           |                     

        $sequence_5 = { 68ec421010 ff35???????? 6aff ff15???????? ff7514 ff7510 ff750c }
            // n = 7, score = 100
            //   68ec421010           | push                0x101042ec
            //   ff35????????         |                     
            //   6aff                 | push                -1
            //   ff15????????         |                     
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_6 = { 59 681c431010 6860ad0010 e8???????? 59 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   681c431010           | push                0x1010431c
            //   6860ad0010           | push                0x1000ad60
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_7 = { 59 59 ffb5eef7ffff ff15???????? 0fb7c0 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ffb5eef7ffff         | push                dword ptr [ebp - 0x812]
            //   ff15????????         |                     
            //   0fb7c0               | movzx               eax, ax

        $sequence_8 = { 7359 ff7508 e8???????? 59 8b4d08 }
            // n = 5, score = 100
            //   7359                 | jae                 0x5b
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_9 = { 59 40 50 68e4401010 e8???????? 59 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   68e4401010           | push                0x101040e4
            //   e8????????           |                     
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 2170880
}