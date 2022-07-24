rule win_redyms_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.redyms."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redyms"
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
        $sequence_0 = { e8???????? 57 ff15???????? 8b4e08 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]

        $sequence_1 = { 57 8855da ffd6 83c408 85c0 0f8594000000 8d4dbc }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8855da               | mov                 byte ptr [ebp - 0x26], dl
            //   ffd6                 | call                esi
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f8594000000         | jne                 0x9a
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]

        $sequence_2 = { 8b4f04 57 ffd1 8b55ac 83c404 57 }
            // n = 6, score = 100
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   57                   | push                edi
            //   ffd1                 | call                ecx
            //   8b55ac               | mov                 edx, dword ptr [ebp - 0x54]
            //   83c404               | add                 esp, 4
            //   57                   | push                edi

        $sequence_3 = { ff15???????? 53 ff15???????? a1???????? 8b5508 8d5828 53 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   a1????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8d5828               | lea                 ebx, [eax + 0x28]
            //   53                   | push                ebx

        $sequence_4 = { ff15???????? 57 ff15???????? a1???????? 8d7828 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   a1????????           |                     
            //   8d7828               | lea                 edi, [eax + 0x28]

        $sequence_5 = { 85db 0f8470010000 6a04 8d8de0feffff 51 6a1f }
            // n = 6, score = 100
            //   85db                 | test                ebx, ebx
            //   0f8470010000         | je                  0x176
            //   6a04                 | push                4
            //   8d8de0feffff         | lea                 ecx, [ebp - 0x120]
            //   51                   | push                ecx
            //   6a1f                 | push                0x1f

        $sequence_6 = { 0f84b9000000 8d642400 8b8598feffff 8b7004 0fbe0c3e 03f7 51 }
            // n = 7, score = 100
            //   0f84b9000000         | je                  0xbf
            //   8d642400             | lea                 esp, [esp]
            //   8b8598feffff         | mov                 eax, dword ptr [ebp - 0x168]
            //   8b7004               | mov                 esi, dword ptr [eax + 4]
            //   0fbe0c3e             | movsx               ecx, byte ptr [esi + edi]
            //   03f7                 | add                 esi, edi
            //   51                   | push                ecx

        $sequence_7 = { 53 8bc7 e8???????? 83c408 eb0b 8b5d10 ebe7 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   8bc7                 | mov                 eax, edi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   eb0b                 | jmp                 0xd
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   ebe7                 | jmp                 0xffffffe9

        $sequence_8 = { 57 6a04 8bf0 6800300000 33db 56 53 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   6a04                 | push                4
            //   8bf0                 | mov                 esi, eax
            //   6800300000           | push                0x3000
            //   33db                 | xor                 ebx, ebx
            //   56                   | push                esi
            //   53                   | push                ebx

        $sequence_9 = { 8bbd98feffff 742e 8b4e04 8b17 807c11fb30 8d0411 }
            // n = 6, score = 100
            //   8bbd98feffff         | mov                 edi, dword ptr [ebp - 0x168]
            //   742e                 | je                  0x30
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   807c11fb30           | cmp                 byte ptr [ecx + edx - 5], 0x30
            //   8d0411               | lea                 eax, [ecx + edx]

    condition:
        7 of them and filesize < 98304
}