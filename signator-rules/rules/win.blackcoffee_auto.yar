rule win_blackcoffee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.blackcoffee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackcoffee"
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
        $sequence_0 = { 6a1c 6a40 ff15???????? 8bf0 33c0 50 }
            // n = 6, score = 200
            //   6a1c                 | push                0x1c
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax

        $sequence_1 = { 53 56 57 8b38 681c010000 6a40 }
            // n = 6, score = 200
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   681c010000           | push                0x11c
            //   6a40                 | push                0x40

        $sequence_2 = { 56 894604 e8???????? ff36 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   e8????????           |                     
            //   ff36                 | push                dword ptr [esi]

        $sequence_3 = { 57 ff15???????? 8bd8 3bdf 747a }
            // n = 5, score = 200
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   3bdf                 | cmp                 ebx, edi
            //   747a                 | je                  0x7c

        $sequence_4 = { 8d85f0feffff 8d7718 8945f8 6a04 895efc }
            // n = 5, score = 200
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   8d7718               | lea                 esi, [edi + 0x18]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   6a04                 | push                4
            //   895efc               | mov                 dword ptr [esi - 4], ebx

        $sequence_5 = { f3ab 8d8568ffffff 33f6 50 }
            // n = 4, score = 200
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8d8568ffffff         | lea                 eax, [ebp - 0x98]
            //   33f6                 | xor                 esi, esi
            //   50                   | push                eax

        $sequence_6 = { 50 894508 e8???????? 8b1d???????? 8945f4 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   e8????????           |                     
            //   8b1d????????         |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_7 = { c7460407100680 8b45fc 89460c c70614000000 }
            // n = 4, score = 200
            //   c7460407100680       | mov                 dword ptr [esi + 4], 0x80061007
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   c70614000000         | mov                 dword ptr [esi], 0x14

        $sequence_8 = { 8bd8 53 e8???????? 89443e04 5f 8bc3 5e }
            // n = 7, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   53                   | push                ebx
            //   e8????????           |                     
            //   89443e04             | mov                 dword ptr [esi + edi + 4], eax
            //   5f                   | pop                 edi
            //   8bc3                 | mov                 eax, ebx
            //   5e                   | pop                 esi

        $sequence_9 = { 750b ff15???????? 89460c eb28 57 57 }
            // n = 6, score = 200
            //   750b                 | jne                 0xd
            //   ff15????????         |                     
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   eb28                 | jmp                 0x2a
            //   57                   | push                edi
            //   57                   | push                edi

    condition:
        7 of them and filesize < 118784
}