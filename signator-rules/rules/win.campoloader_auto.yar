rule win_campoloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.campoloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.campoloader"
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
        $sequence_0 = { 75ee 8b45d8 2b45b4 8945b0 8b4db0 894dc8 eb39 }
            // n = 7, score = 200
            //   75ee                 | jne                 0xfffffff0
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   2b45b4               | sub                 eax, dword ptr [ebp - 0x4c]
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   8b4db0               | mov                 ecx, dword ptr [ebp - 0x50]
            //   894dc8               | mov                 dword ptr [ebp - 0x38], ecx
            //   eb39                 | jmp                 0x3b

        $sequence_1 = { 8945f0 837df000 743e 8b55f0 2b5508 }
            // n = 5, score = 200
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0
            //   743e                 | je                  0x40
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   2b5508               | sub                 edx, dword ptr [ebp + 8]

        $sequence_2 = { 3b4da0 7318 8b5508 0355cc 0fbe02 83f82f 7508 }
            // n = 7, score = 200
            //   3b4da0               | cmp                 ecx, dword ptr [ebp - 0x60]
            //   7318                 | jae                 0x1a
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0355cc               | add                 edx, dword ptr [ebp - 0x34]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   83f82f               | cmp                 eax, 0x2f
            //   7508                 | jne                 0xa

        $sequence_3 = { ff15???????? 83c408 8945f0 837df000 743c }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0
            //   743c                 | je                  0x3e

        $sequence_4 = { 8345dc01 807de700 75ee 8b45dc 2b45bc 8945b8 }
            // n = 6, score = 200
            //   8345dc01             | add                 dword ptr [ebp - 0x24], 1
            //   807de700             | cmp                 byte ptr [ebp - 0x19], 0
            //   75ee                 | jne                 0xfffffff0
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   2b45bc               | sub                 eax, dword ptr [ebp - 0x44]
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax

        $sequence_5 = { 50 ff15???????? 83c40c 8d8d54efffff 51 8d95ecfdffff }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   8d8d54efffff         | lea                 ecx, [ebp - 0x10ac]
            //   51                   | push                ecx
            //   8d95ecfdffff         | lea                 edx, [ebp - 0x214]

        $sequence_6 = { 8a0d???????? 884df8 6804010000 6a00 }
            // n = 4, score = 200
            //   8a0d????????         |                     
            //   884df8               | mov                 byte ptr [ebp - 8], cl
            //   6804010000           | push                0x104
            //   6a00                 | push                0

        $sequence_7 = { 51 8d55f4 52 8b4508 50 ff15???????? }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   8d55f4               | lea                 edx, [ebp - 0xc]
            //   52                   | push                edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_8 = { 66898522f1ffff b902000000 66898d20f1ffff ba04000000 6bc200 8b8d50efffff 8b510c }
            // n = 7, score = 200
            //   66898522f1ffff       | mov                 word ptr [ebp - 0xede], ax
            //   b902000000           | mov                 ecx, 2
            //   66898d20f1ffff       | mov                 word ptr [ebp - 0xee0], cx
            //   ba04000000           | mov                 edx, 4
            //   6bc200               | imul                eax, edx, 0
            //   8b8d50efffff         | mov                 ecx, dword ptr [ebp - 0x10b0]
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]

        $sequence_9 = { 8945fc 56 57 6a44 6a00 8d4588 }
            // n = 6, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a44                 | push                0x44
            //   6a00                 | push                0
            //   8d4588               | lea                 eax, [ebp - 0x78]

    condition:
        7 of them and filesize < 66560
}