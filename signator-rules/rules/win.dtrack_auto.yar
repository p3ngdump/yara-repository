rule win_dtrack_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dtrack."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dtrack"
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
        $sequence_0 = { 52 8b4508 50 e8???????? 83c414 8b4d10 51 }
            // n = 7, score = 400
            //   52                   | push                edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   51                   | push                ecx

        $sequence_1 = { 3b5514 7d43 8b45f8 c1e808 8b4df8 c1e902 }
            // n = 6, score = 300
            //   3b5514               | cmp                 edx, dword ptr [ebp + 0x14]
            //   7d43                 | jge                 0x45
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   c1e808               | shr                 eax, 8
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   c1e902               | shr                 ecx, 2

        $sequence_2 = { e8???????? 83c408 8a4d0c 80c101 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8a4d0c               | mov                 cl, byte ptr [ebp + 0xc]
            //   80c101               | add                 cl, 1

        $sequence_3 = { 50 6a01 6a01 8d8d9efaffff 51 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a01                 | push                1
            //   8d8d9efaffff         | lea                 ecx, [ebp - 0x562]
            //   51                   | push                ecx

        $sequence_4 = { 51 e8???????? 83c40c 8b5508 52 68???????? 8d85e8fbffff }
            // n = 7, score = 300
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   68????????           |                     
            //   8d85e8fbffff         | lea                 eax, [ebp - 0x418]

        $sequence_5 = { 8b850cf5ffff 50 8d8d90f5ffff 51 e8???????? 83c414 }
            // n = 6, score = 300
            //   8b850cf5ffff         | mov                 eax, dword ptr [ebp - 0xaf4]
            //   50                   | push                eax
            //   8d8d90f5ffff         | lea                 ecx, [ebp - 0xa70]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14

        $sequence_6 = { 3a4a01 7523 838524eaffff02 838528eaffff02 80bd22eaffff00 }
            // n = 5, score = 300
            //   3a4a01               | cmp                 cl, byte ptr [edx + 1]
            //   7523                 | jne                 0x25
            //   838524eaffff02       | add                 dword ptr [ebp - 0x15dc], 2
            //   838528eaffff02       | add                 dword ptr [ebp - 0x15d8], 2
            //   80bd22eaffff00       | cmp                 byte ptr [ebp - 0x15de], 0

        $sequence_7 = { 51 e8???????? 83c410 8b558c }
            // n = 4, score = 300
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8b558c               | mov                 edx, dword ptr [ebp - 0x74]

        $sequence_8 = { 8b5508 8b82fc180000 8b4d08 8b55f8 89948104100000 }
            // n = 5, score = 300
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b82fc180000         | mov                 eax, dword ptr [edx + 0x18fc]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   89948104100000       | mov                 dword ptr [ecx + eax*4 + 0x1004], edx

        $sequence_9 = { c1e810 23c8 33d1 8855f7 8b4df8 }
            // n = 5, score = 200
            //   c1e810               | shr                 eax, 0x10
            //   23c8                 | and                 ecx, eax
            //   33d1                 | xor                 edx, ecx
            //   8855f7               | mov                 byte ptr [ebp - 9], dl
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_10 = { 23c1 33d0 8b45fc c1e818 33d0 }
            // n = 5, score = 200
            //   23c1                 | and                 eax, ecx
            //   33d0                 | xor                 edx, eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c1e818               | shr                 eax, 0x18
            //   33d0                 | xor                 edx, eax

        $sequence_11 = { 81e2ff000000 c1e217 0bca 894d14 8b45f8 }
            // n = 5, score = 200
            //   81e2ff000000         | and                 edx, 0xff
            //   c1e217               | shl                 edx, 0x17
            //   0bca                 | or                  ecx, edx
            //   894d14               | mov                 dword ptr [ebp + 0x14], ecx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_12 = { 8b4d10 51 6a00 8b55f4 }
            // n = 4, score = 200
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]

        $sequence_13 = { 83c40c 8b450c 8b08 894dfc 8b550c 8b4204 8945f8 }
            // n = 7, score = 200
            //   83c40c               | add                 esp, 0xc
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_14 = { 837df400 7412 837d0800 740c 837d0c00 7406 }
            // n = 6, score = 200
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0
            //   7412                 | je                  0x14
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   740c                 | je                  0xe
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7406                 | je                  8

    condition:
        7 of them and filesize < 1736704
}