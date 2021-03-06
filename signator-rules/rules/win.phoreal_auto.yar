rule win_phoreal_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.phoreal."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.phoreal"
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
        $sequence_0 = { 895008 e8???????? 56 8bf8 e8???????? 83c410 3bfb }
            // n = 7, score = 200
            //   895008               | mov                 dword ptr [eax + 8], edx
            //   e8????????           |                     
            //   56                   | push                esi
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   3bfb                 | cmp                 edi, ebx

        $sequence_1 = { 3b857cffffff 0f8537fcffff 8bb560ffffff 8b8564ffffff 89bd74ffffff 3bf0 7411 }
            // n = 7, score = 200
            //   3b857cffffff         | cmp                 eax, dword ptr [ebp - 0x84]
            //   0f8537fcffff         | jne                 0xfffffc3d
            //   8bb560ffffff         | mov                 esi, dword ptr [ebp - 0xa0]
            //   8b8564ffffff         | mov                 eax, dword ptr [ebp - 0x9c]
            //   89bd74ffffff         | mov                 dword ptr [ebp - 0x8c], edi
            //   3bf0                 | cmp                 esi, eax
            //   7411                 | je                  0x13

        $sequence_2 = { 7436 8da42400000000 8b4c2410 8b4304 51 }
            // n = 5, score = 200
            //   7436                 | je                  0x38
            //   8da42400000000       | lea                 esp, [esp]
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   51                   | push                ecx

        $sequence_3 = { ff15???????? 85c0 744d 8d45e0 897dd8 895dd4 885dc4 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   744d                 | je                  0x4f
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   897dd8               | mov                 dword ptr [ebp - 0x28], edi
            //   895dd4               | mov                 dword ptr [ebp - 0x2c], ebx
            //   885dc4               | mov                 byte ptr [ebp - 0x3c], bl

        $sequence_4 = { 50 57 51 ff15???????? 85c0 7453 8b9574ffffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   57                   | push                edi
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7453                 | je                  0x55
            //   8b9574ffffff         | mov                 edx, dword ptr [ebp - 0x8c]

        $sequence_5 = { 0f8523010000 e8???????? 8d9558ffffff 6a04 52 }
            // n = 5, score = 200
            //   0f8523010000         | jne                 0x129
            //   e8????????           |                     
            //   8d9558ffffff         | lea                 edx, [ebp - 0xa8]
            //   6a04                 | push                4
            //   52                   | push                edx

        $sequence_6 = { 53 56 51 8b4d18 e8???????? 8b8c24e0000000 83c424 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   56                   | push                esi
            //   51                   | push                ecx
            //   8b4d18               | mov                 ecx, dword ptr [ebp + 0x18]
            //   e8????????           |                     
            //   8b8c24e0000000       | mov                 ecx, dword ptr [esp + 0xe0]
            //   83c424               | add                 esp, 0x24

        $sequence_7 = { 8b4db0 51 50 e8???????? 8bf0 }
            // n = 5, score = 200
            //   8b4db0               | mov                 ecx, dword ptr [ebp - 0x50]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_8 = { 83c404 33c0 c7461407000000 897e10 668906 83c61c }
            // n = 6, score = 200
            //   83c404               | add                 esp, 4
            //   33c0                 | xor                 eax, eax
            //   c7461407000000       | mov                 dword ptr [esi + 0x14], 7
            //   897e10               | mov                 dword ptr [esi + 0x10], edi
            //   668906               | mov                 word ptr [esi], ax
            //   83c61c               | add                 esi, 0x1c

        $sequence_9 = { 743b 6a00 8d4dcc 8bf8 e8???????? 8b4704 }
            // n = 6, score = 200
            //   743b                 | je                  0x3d
            //   6a00                 | push                0
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   8b4704               | mov                 eax, dword ptr [edi + 4]

    condition:
        7 of them and filesize < 622592
}