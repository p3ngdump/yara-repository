rule win_blackmatter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.blackmatter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackmatter"
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
        $sequence_0 = { 52 50 ff15???????? 83c410 ff750c ff7508 }
            // n = 6, score = 400
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_1 = { 43 6a00 6800001000 ff75f4 ff75f0 }
            // n = 5, score = 400
            //   43                   | inc                 ebx
            //   6a00                 | push                0
            //   6800001000           | push                0x100000
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_2 = { e8???????? c745f000000000 8d85a0fdffff 50 ff75fc }
            // n = 5, score = 400
            //   e8????????           |                     
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   8d85a0fdffff         | lea                 eax, [ebp - 0x260]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_3 = { 8b4d08 8b45f4 8901 8b4d0c 8b45f0 8901 8b4d10 }
            // n = 7, score = 400
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]

        $sequence_4 = { 50 57 ff15???????? 83c40c eb10 8d45da }
            // n = 6, score = 400
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   eb10                 | jmp                 0x12
            //   8d45da               | lea                 eax, [ebp - 0x26]

        $sequence_5 = { 6800000080 56 ff15???????? 8945f8 837df8ff 751e }
            // n = 6, score = 400
            //   6800000080           | push                0x80000000
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   837df8ff             | cmp                 dword ptr [ebp - 8], -1
            //   751e                 | jne                 0x20

        $sequence_6 = { 85f6 0f842c010000 56 ff35???????? e8???????? ff35???????? e8???????? }
            // n = 7, score = 400
            //   85f6                 | test                esi, esi
            //   0f842c010000         | je                  0x132
            //   56                   | push                esi
            //   ff35????????         |                     
            //   e8????????           |                     
            //   ff35????????         |                     
            //   e8????????           |                     

        $sequence_7 = { 3945f4 7405 8945f0 eb02 ebdd }
            // n = 5, score = 400
            //   3945f4               | cmp                 dword ptr [ebp - 0xc], eax
            //   7405                 | je                  7
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   eb02                 | jmp                 4
            //   ebdd                 | jmp                 0xffffffdf

        $sequence_8 = { ff733c e8???????? 3b4508 7508 }
            // n = 4, score = 400
            //   ff733c               | push                dword ptr [ebx + 0x3c]
            //   e8????????           |                     
            //   3b4508               | cmp                 eax, dword ptr [ebp + 8]
            //   7508                 | jne                 0xa

        $sequence_9 = { 8b7128 8b792c 115020 115824 117028 11782c }
            // n = 6, score = 400
            //   8b7128               | mov                 esi, dword ptr [ecx + 0x28]
            //   8b792c               | mov                 edi, dword ptr [ecx + 0x2c]
            //   115020               | adc                 dword ptr [eax + 0x20], edx
            //   115824               | adc                 dword ptr [eax + 0x24], ebx
            //   117028               | adc                 dword ptr [eax + 0x28], esi
            //   11782c               | adc                 dword ptr [eax + 0x2c], edi

    condition:
        7 of them and filesize < 194560
}