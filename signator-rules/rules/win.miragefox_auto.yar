rule win_miragefox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.miragefox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miragefox"
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
        $sequence_0 = { 50 ffb628040000 ff15???????? 57 8bf0 e8???????? 59 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffb628040000         | push                dword ptr [esi + 0x428]
            //   ff15????????         |                     
            //   57                   | push                edi
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { 894dec 8845d8 897ddc 897de0 897de4 }
            // n = 5, score = 100
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   8845d8               | mov                 byte ptr [ebp - 0x28], al
            //   897ddc               | mov                 dword ptr [ebp - 0x24], edi
            //   897de0               | mov                 dword ptr [ebp - 0x20], edi
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi

        $sequence_2 = { 85c0 a3???????? 7424 68???????? 57 ffd6 85c0 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   a3????????           |                     
            //   7424                 | je                  0x26
            //   68????????           |                     
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax

        $sequence_3 = { 0f841bffffff ff7614 e8???????? ff760c }
            // n = 4, score = 100
            //   0f841bffffff         | je                  0xffffff21
            //   ff7614               | push                dword ptr [esi + 0x14]
            //   e8????????           |                     
            //   ff760c               | push                dword ptr [esi + 0xc]

        $sequence_4 = { 741f 8d4d1c e8???????? 8b7008 8d4d2c }
            // n = 5, score = 100
            //   741f                 | je                  0x21
            //   8d4d1c               | lea                 ecx, [ebp + 0x1c]
            //   e8????????           |                     
            //   8b7008               | mov                 esi, dword ptr [eax + 8]
            //   8d4d2c               | lea                 ecx, [ebp + 0x2c]

        $sequence_5 = { 89bd64bbffff 50 e8???????? ff75fc ffd6 399d78bcffff 7510 }
            // n = 7, score = 100
            //   89bd64bbffff         | mov                 dword ptr [ebp - 0x449c], edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd6                 | call                esi
            //   399d78bcffff         | cmp                 dword ptr [ebp - 0x4388], ebx
            //   7510                 | jne                 0x12

        $sequence_6 = { 59 33c0 8dbd25fcffff 6a00 f3ab 66ab 8b4dec }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   8dbd25fcffff         | lea                 edi, [ebp - 0x3db]
            //   6a00                 | push                0
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

        $sequence_7 = { 33ff 56 8d8550feffff 57 50 e8???????? }
            // n = 6, score = 100
            //   33ff                 | xor                 edi, edi
            //   56                   | push                esi
            //   8d8550feffff         | lea                 eax, [ebp - 0x1b0]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 8d04c0 8b0c8d20f52a00 8a448104 83e040 c3 55 }
            // n = 6, score = 100
            //   8d04c0               | lea                 eax, [eax + eax*8]
            //   8b0c8d20f52a00       | mov                 ecx, dword ptr [ecx*4 + 0x2af520]
            //   8a448104             | mov                 al, byte ptr [ecx + eax*4 + 4]
            //   83e040               | and                 eax, 0x40
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_9 = { e8???????? 53 56 57 8db908010000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8db908010000         | lea                 edi, [ecx + 0x108]

    condition:
        7 of them and filesize < 286720
}