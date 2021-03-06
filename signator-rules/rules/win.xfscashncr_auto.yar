rule win_xfscashncr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.xfscashncr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xfscashncr"
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
        $sequence_0 = { 83c901 898decfeffff 8b4508 52 8bcd 50 8d1558894800 }
            // n = 7, score = 100
            //   83c901               | or                  ecx, 1
            //   898decfeffff         | mov                 dword ptr [ebp - 0x114], ecx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   8bcd                 | mov                 ecx, ebp
            //   50                   | push                eax
            //   8d1558894800         | lea                 edx, [0x488958]

        $sequence_1 = { 83c902 8b5520 890a eb2a b801000000 6bc000 }
            // n = 6, score = 100
            //   83c902               | or                  ecx, 2
            //   8b5520               | mov                 edx, dword ptr [ebp + 0x20]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   eb2a                 | jmp                 0x2c
            //   b801000000           | mov                 eax, 1
            //   6bc000               | imul                eax, eax, 0

        $sequence_2 = { 0fb685bbfeffff 50 8b8db4feffff e8???????? 8985b0feffff 8b8db0feffff 898dc0feffff }
            // n = 7, score = 100
            //   0fb685bbfeffff       | movzx               eax, byte ptr [ebp - 0x145]
            //   50                   | push                eax
            //   8b8db4feffff         | mov                 ecx, dword ptr [ebp - 0x14c]
            //   e8????????           |                     
            //   8985b0feffff         | mov                 dword ptr [ebp - 0x150], eax
            //   8b8db0feffff         | mov                 ecx, dword ptr [ebp - 0x150]
            //   898dc0feffff         | mov                 dword ptr [ebp - 0x140], ecx

        $sequence_3 = { e8???????? 8bc8 e8???????? 8bc8 e8???????? 68???????? 68???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   68????????           |                     
            //   68????????           |                     

        $sequence_4 = { c645fc05 8b8d54f7ffff e8???????? 50 68???????? 8b8588f9ffff 50 }
            // n = 7, score = 100
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   8b8d54f7ffff         | mov                 ecx, dword ptr [ebp - 0x8ac]
            //   e8????????           |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   8b8588f9ffff         | mov                 eax, dword ptr [ebp - 0x678]
            //   50                   | push                eax

        $sequence_5 = { 8945f4 e9???????? e9???????? 33c9 66894dc0 6a01 8d55c0 }
            // n = 7, score = 100
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   e9????????           |                     
            //   e9????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   66894dc0             | mov                 word ptr [ebp - 0x40], cx
            //   6a01                 | push                1
            //   8d55c0               | lea                 edx, [ebp - 0x40]

        $sequence_6 = { 4a 0078c4 4a 0091c44a00aa c44a00 2f c54a00 }
            // n = 7, score = 100
            //   4a                   | dec                 edx
            //   0078c4               | add                 byte ptr [eax - 0x3c], bh
            //   4a                   | dec                 edx
            //   0091c44a00aa         | add                 byte ptr [ecx - 0x55ffb53c], dl
            //   c44a00               | les                 ecx, ptr [edx]
            //   2f                   | das                 
            //   c54a00               | lds                 ecx, ptr [edx]

        $sequence_7 = { 8b85b4feffff 8945a4 837db000 0f8684000000 e8???????? 8985ccfeffff 8d45a4 }
            // n = 7, score = 100
            //   8b85b4feffff         | mov                 eax, dword ptr [ebp - 0x14c]
            //   8945a4               | mov                 dword ptr [ebp - 0x5c], eax
            //   837db000             | cmp                 dword ptr [ebp - 0x50], 0
            //   0f8684000000         | jbe                 0x8a
            //   e8????????           |                     
            //   8985ccfeffff         | mov                 dword ptr [ebp - 0x134], eax
            //   8d45a4               | lea                 eax, [ebp - 0x5c]

        $sequence_8 = { 0fbe00 3bf0 7522 837d8800 7522 8b8d7cffffff 0fbe31 }
            // n = 7, score = 100
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   3bf0                 | cmp                 esi, eax
            //   7522                 | jne                 0x24
            //   837d8800             | cmp                 dword ptr [ebp - 0x78], 0
            //   7522                 | jne                 0x24
            //   8b8d7cffffff         | mov                 ecx, dword ptr [ebp - 0x84]
            //   0fbe31               | movsx               esi, byte ptr [ecx]

        $sequence_9 = { 740c c785b8deffff14025500 eb0a c785b8deffff10e25400 837d1000 740b 8b4510 }
            // n = 7, score = 100
            //   740c                 | je                  0xe
            //   c785b8deffff14025500     | mov    dword ptr [ebp - 0x2148], 0x550214
            //   eb0a                 | jmp                 0xc
            //   c785b8deffff10e25400     | mov    dword ptr [ebp - 0x2148], 0x54e210
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   740b                 | je                  0xd
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

    condition:
        7 of them and filesize < 3126272
}