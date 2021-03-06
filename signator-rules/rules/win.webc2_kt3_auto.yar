rule win_webc2_kt3_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.webc2_kt3."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_kt3"
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
        $sequence_0 = { 6a00 8b45dc 8b4814 51 ff15???????? }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   8b4814               | mov                 ecx, dword ptr [eax + 0x14]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_1 = { 83c408 8985a4feffff 83bda4feffff00 0f84d2000000 6a2f 8b5508 52 }
            // n = 7, score = 100
            //   83c408               | add                 esp, 8
            //   8985a4feffff         | mov                 dword ptr [ebp - 0x15c], eax
            //   83bda4feffff00       | cmp                 dword ptr [ebp - 0x15c], 0
            //   0f84d2000000         | je                  0xd8
            //   6a2f                 | push                0x2f
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx

        $sequence_2 = { dd5808 e9???????? 8b4de8 0fbe11 }
            // n = 4, score = 100
            //   dd5808               | fstp                qword ptr [eax + 8]
            //   e9????????           |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   0fbe11               | movsx               edx, byte ptr [ecx]

        $sequence_3 = { 8b4814 51 ff15???????? 6a01 8b55dc 8b4208 50 }
            // n = 7, score = 100
            //   8b4814               | mov                 ecx, dword ptr [eax + 0x14]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   8b55dc               | mov                 edx, dword ptr [ebp - 0x24]
            //   8b4208               | mov                 eax, dword ptr [edx + 8]
            //   50                   | push                eax

        $sequence_4 = { 8b4508 56 833c85d0a5400000 8d3485d0a54000 753e 57 }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   833c85d0a5400000     | cmp                 dword ptr [eax*4 + 0x40a5d0], 0
            //   8d3485d0a54000       | lea                 esi, [eax*4 + 0x40a5d0]
            //   753e                 | jne                 0x40
            //   57                   | push                edi

        $sequence_5 = { c7405038a54000 c7401401000000 c3 56 }
            // n = 4, score = 100
            //   c7405038a54000       | mov                 dword ptr [eax + 0x50], 0x40a538
            //   c7401401000000       | mov                 dword ptr [eax + 0x14], 1
            //   c3                   | ret                 
            //   56                   | push                esi

        $sequence_6 = { ff3485d0a54000 ff15???????? 5d c3 53 }
            // n = 5, score = 100
            //   ff3485d0a54000       | push                dword ptr [eax*4 + 0x40a5d0]
            //   ff15????????         |                     
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   53                   | push                ebx

        $sequence_7 = { c745ec00000000 c745f000000000 6a18 e8???????? 83c404 8945e8 8b45e8 }
            // n = 7, score = 100
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   6a18                 | push                0x18
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_8 = { 0345f8 c60000 8b4de8 51 ff15???????? 8b55e8 }
            // n = 6, score = 100
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   c60000               | mov                 byte ptr [eax], 0
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]

        $sequence_9 = { c70002000000 8b4de8 83c102 8bf9 8b5508 83c234 83c9ff }
            // n = 7, score = 100
            //   c70002000000         | mov                 dword ptr [eax], 2
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   83c102               | add                 ecx, 2
            //   8bf9                 | mov                 edi, ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83c234               | add                 edx, 0x34
            //   83c9ff               | or                  ecx, 0xffffffff

    condition:
        7 of them and filesize < 114688
}