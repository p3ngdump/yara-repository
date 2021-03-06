rule win_paladin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.paladin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.paladin"
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
        $sequence_0 = { 89442438 ffd0 6a0a ff15???????? b919000000 }
            // n = 5, score = 200
            //   89442438             | mov                 dword ptr [esp + 0x38], eax
            //   ffd0                 | call                eax
            //   6a0a                 | push                0xa
            //   ff15????????         |                     
            //   b919000000           | mov                 ecx, 0x19

        $sequence_1 = { 894664 8b465c 6a00 57 }
            // n = 4, score = 200
            //   894664               | mov                 dword ptr [esi + 0x64], eax
            //   8b465c               | mov                 eax, dword ptr [esi + 0x5c]
            //   6a00                 | push                0
            //   57                   | push                edi

        $sequence_2 = { c64424153a c64424165c c644241700 ff15???????? 83f801 0f840b010000 6810040000 }
            // n = 7, score = 200
            //   c64424153a           | mov                 byte ptr [esp + 0x15], 0x3a
            //   c64424165c           | mov                 byte ptr [esp + 0x16], 0x5c
            //   c644241700           | mov                 byte ptr [esp + 0x17], 0
            //   ff15????????         |                     
            //   83f801               | cmp                 eax, 1
            //   0f840b010000         | je                  0x111
            //   6810040000           | push                0x410

        $sequence_3 = { 56 33db 57 3bc3 8965f0 895dd0 c745ccffffffff }
            // n = 7, score = 200
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   3bc3                 | cmp                 eax, ebx
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   c745ccffffffff       | mov                 dword ptr [ebp - 0x34], 0xffffffff

        $sequence_4 = { e8???????? 8b4e3c 6a00 894664 8b465c 6a00 57 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b4e3c               | mov                 ecx, dword ptr [esi + 0x3c]
            //   6a00                 | push                0
            //   894664               | mov                 dword ptr [esi + 0x64], eax
            //   8b465c               | mov                 eax, dword ptr [esi + 0x5c]
            //   6a00                 | push                0
            //   57                   | push                edi

        $sequence_5 = { e8???????? 8b4de8 51 ff15???????? c645fc01 8d8dc0e5fcff }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8d8dc0e5fcff         | lea                 ecx, [ebp - 0x31a40]

        $sequence_6 = { 66ab aa 8d7d0c 8d7514 8d5d18 68???????? 68???????? }
            // n = 7, score = 200
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8d7d0c               | lea                 edi, [ebp + 0xc]
            //   8d7514               | lea                 esi, [ebp + 0x14]
            //   8d5d18               | lea                 ebx, [ebp + 0x18]
            //   68????????           |                     
            //   68????????           |                     

        $sequence_7 = { 85c0 7408 50 68???????? ffd7 8b44241c 5f }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   50                   | push                eax
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   5f                   | pop                 edi

        $sequence_8 = { 8b463c 8b4e24 8b5620 6a00 }
            // n = 4, score = 200
            //   8b463c               | mov                 eax, dword ptr [esi + 0x3c]
            //   8b4e24               | mov                 ecx, dword ptr [esi + 0x24]
            //   8b5620               | mov                 edx, dword ptr [esi + 0x20]
            //   6a00                 | push                0

        $sequence_9 = { 50 57 ff15???????? 8b4614 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b4614               | mov                 eax, dword ptr [esi + 0x14]

    condition:
        7 of them and filesize < 106496
}