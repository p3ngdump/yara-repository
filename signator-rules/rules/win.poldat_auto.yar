rule win_poldat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.poldat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poldat"
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
        $sequence_0 = { 8b4604 85c0 0f84f2000000 48 8b561c }
            // n = 5, score = 100
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   85c0                 | test                eax, eax
            //   0f84f2000000         | je                  0xf8
            //   48                   | dec                 eax
            //   8b561c               | mov                 edx, dword ptr [esi + 0x1c]

        $sequence_1 = { 50 ff15???????? 8bf0 8b85acfdffff }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8b85acfdffff         | mov                 eax, dword ptr [ebp - 0x254]

        $sequence_2 = { 83c410 8906 8b4510 5e }
            // n = 4, score = 100
            //   83c410               | add                 esp, 0x10
            //   8906                 | mov                 dword ptr [esi], eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   5e                   | pop                 esi

        $sequence_3 = { 53 50 e8???????? 81c46c0c0000 8d85ecfdffff }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     
            //   81c46c0c0000         | add                 esp, 0xc6c
            //   8d85ecfdffff         | lea                 eax, [ebp - 0x214]

        $sequence_4 = { 85c0 0f8485030000 833e00 0f847c030000 8b542418 }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   0f8485030000         | je                  0x38b
            //   833e00               | cmp                 dword ptr [esi], 0
            //   0f847c030000         | je                  0x382
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]

        $sequence_5 = { 2bc3 8b0c9d68c34100 23ca 034e04 894c242c 8bcb d3ea }
            // n = 7, score = 100
            //   2bc3                 | sub                 eax, ebx
            //   8b0c9d68c34100       | mov                 ecx, dword ptr [ebx*4 + 0x41c368]
            //   23ca                 | and                 ecx, edx
            //   034e04               | add                 ecx, dword ptr [esi + 4]
            //   894c242c             | mov                 dword ptr [esp + 0x2c], ecx
            //   8bcb                 | mov                 ecx, ebx
            //   d3ea                 | shr                 edx, cl

        $sequence_6 = { e8???????? 8b7d08 8b5d0c 8d45fc 6a04 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   6a04                 | push                4

        $sequence_7 = { 8d85ecfdffff 50 e8???????? 83c418 b800200300 }
            // n = 5, score = 100
            //   8d85ecfdffff         | lea                 eax, [ebp - 0x214]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   b800200300           | mov                 eax, 0x32000

        $sequence_8 = { c645d12e c645d230 c645d32e c645d431 c645d520 c645d62d }
            // n = 6, score = 100
            //   c645d12e             | mov                 byte ptr [ebp - 0x2f], 0x2e
            //   c645d230             | mov                 byte ptr [ebp - 0x2e], 0x30
            //   c645d32e             | mov                 byte ptr [ebp - 0x2d], 0x2e
            //   c645d431             | mov                 byte ptr [ebp - 0x2c], 0x31
            //   c645d520             | mov                 byte ptr [ebp - 0x2b], 0x20
            //   c645d62d             | mov                 byte ptr [ebp - 0x2a], 0x2d

        $sequence_9 = { e8???????? 83c420 8d85a4fbffff 50 8d859cf9ffff }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20
            //   8d85a4fbffff         | lea                 eax, [ebp - 0x45c]
            //   50                   | push                eax
            //   8d859cf9ffff         | lea                 eax, [ebp - 0x664]

    condition:
        7 of them and filesize < 247808
}