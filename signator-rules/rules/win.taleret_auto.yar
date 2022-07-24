rule win_taleret_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.taleret."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taleret"
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
        $sequence_0 = { 81bc248016000004010000 0f8334030000 8d7b01 83c9ff 33c0 8d942458020000 f2ae }
            // n = 7, score = 100
            //   81bc248016000004010000     | cmp    dword ptr [esp + 0x1680], 0x104
            //   0f8334030000         | jae                 0x33a
            //   8d7b01               | lea                 edi, [ebx + 1]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   8d942458020000       | lea                 edx, [esp + 0x258]
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_1 = { 85c0 742d 817c2418c8000000 7517 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   742d                 | je                  0x2f
            //   817c2418c8000000     | cmp                 dword ptr [esp + 0x18], 0xc8
            //   7517                 | jne                 0x19

        $sequence_2 = { 2bc8 89742428 894c2410 75c1 }
            // n = 4, score = 100
            //   2bc8                 | sub                 ecx, eax
            //   89742428             | mov                 dword ptr [esp + 0x28], esi
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx
            //   75c1                 | jne                 0xffffffc3

        $sequence_3 = { e8???????? 8b5500 8b72f8 85f6 7463 8d4602 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b5500               | mov                 edx, dword ptr [ebp]
            //   8b72f8               | mov                 esi, dword ptr [edx - 8]
            //   85f6                 | test                esi, esi
            //   7463                 | je                  0x65
            //   8d4602               | lea                 eax, [esi + 2]
            //   50                   | push                eax

        $sequence_4 = { e8???????? 8b4338 85c0 751e 8d442410 68???????? 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4338               | mov                 eax, dword ptr [ebx + 0x38]
            //   85c0                 | test                eax, eax
            //   751e                 | jne                 0x20
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_5 = { 85c0 7408 6a00 ff15???????? 8b4c2410 8b54240c }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]

        $sequence_6 = { c744242401000000 50 ff15???????? 85c0 }
            // n = 4, score = 100
            //   c744242401000000     | mov                 dword ptr [esp + 0x24], 1
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_7 = { ff15???????? 85c0 743a 8b442414 2bf0 03d8 85f6 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   743a                 | je                  0x3c
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   2bf0                 | sub                 esi, eax
            //   03d8                 | add                 ebx, eax
            //   85f6                 | test                esi, esi

        $sequence_8 = { ffd5 3d02010000 752a 8d542410 52 ffd7 8d442410 }
            // n = 7, score = 100
            //   ffd5                 | call                ebp
            //   3d02010000           | cmp                 eax, 0x102
            //   752a                 | jne                 0x2c
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   8d442410             | lea                 eax, [esp + 0x10]

        $sequence_9 = { 85c0 7529 ff15???????? 83f87a }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7529                 | jne                 0x2b
            //   ff15????????         |                     
            //   83f87a               | cmp                 eax, 0x7a

    condition:
        7 of them and filesize < 73728
}