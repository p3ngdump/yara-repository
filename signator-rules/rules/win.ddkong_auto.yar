rule win_ddkong_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ddkong."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ddkong"
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
        $sequence_0 = { c645b36e c645b476 c645b569 c645b672 c645b76f }
            // n = 5, score = 100
            //   c645b36e             | mov                 byte ptr [ebp - 0x4d], 0x6e
            //   c645b476             | mov                 byte ptr [ebp - 0x4c], 0x76
            //   c645b569             | mov                 byte ptr [ebp - 0x4b], 0x69
            //   c645b672             | mov                 byte ptr [ebp - 0x4a], 0x72
            //   c645b76f             | mov                 byte ptr [ebp - 0x49], 0x6f

        $sequence_1 = { 56 8b35???????? 8d459c 57 bb???????? 50 53 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b35????????         |                     
            //   8d459c               | lea                 eax, [ebp - 0x64]
            //   57                   | push                edi
            //   bb????????           |                     
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_2 = { a3???????? 85c0 7456 8065da00 8d4dd0 68???????? 51 }
            // n = 7, score = 100
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7456                 | je                  0x58
            //   8065da00             | and                 byte ptr [ebp - 0x26], 0
            //   8d4dd0               | lea                 ecx, [ebp - 0x30]
            //   68????????           |                     
            //   51                   | push                ecx

        $sequence_3 = { 8b842980000000 85c0 8b942984000000 8d3c28 89542414 897c241c 747c }
            // n = 7, score = 100
            //   8b842980000000       | mov                 eax, dword ptr [ecx + ebp + 0x80]
            //   85c0                 | test                eax, eax
            //   8b942984000000       | mov                 edx, dword ptr [ecx + ebp + 0x84]
            //   8d3c28               | lea                 edi, [eax + ebp]
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   897c241c             | mov                 dword ptr [esp + 0x1c], edi
            //   747c                 | je                  0x7e

        $sequence_4 = { 68???????? ffd7 50 ffd6 898520ffffff c645dc43 }
            // n = 6, score = 100
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   898520ffffff         | mov                 dword ptr [ebp - 0xe0], eax
            //   c645dc43             | mov                 byte ptr [ebp - 0x24], 0x43

        $sequence_5 = { c6459144 c6459269 c6459373 c6459461 c6459562 }
            // n = 5, score = 100
            //   c6459144             | mov                 byte ptr [ebp - 0x6f], 0x44
            //   c6459269             | mov                 byte ptr [ebp - 0x6e], 0x69
            //   c6459373             | mov                 byte ptr [ebp - 0x6d], 0x73
            //   c6459461             | mov                 byte ptr [ebp - 0x6c], 0x61
            //   c6459562             | mov                 byte ptr [ebp - 0x6b], 0x62

        $sequence_6 = { c645c161 c645c26c c645c36c ff15???????? 8d45b8 50 56 }
            // n = 7, score = 100
            //   c645c161             | mov                 byte ptr [ebp - 0x3f], 0x61
            //   c645c26c             | mov                 byte ptr [ebp - 0x3e], 0x6c
            //   c645c36c             | mov                 byte ptr [ebp - 0x3d], 0x6c
            //   ff15????????         |                     
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_7 = { a1???????? 6a00 6a01 c6004d }
            // n = 4, score = 100
            //   a1????????           |                     
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   c6004d               | mov                 byte ptr [eax], 0x4d

        $sequence_8 = { ff35???????? 6a40 ff55f4 57 50 56 a3???????? }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   6a40                 | push                0x40
            //   ff55f4               | call                dword ptr [ebp - 0xc]
            //   57                   | push                edi
            //   50                   | push                eax
            //   56                   | push                esi
            //   a3????????           |                     

        $sequence_9 = { c6458672 c6458769 c6458874 c6458979 }
            // n = 4, score = 100
            //   c6458672             | mov                 byte ptr [ebp - 0x7a], 0x72
            //   c6458769             | mov                 byte ptr [ebp - 0x79], 0x69
            //   c6458874             | mov                 byte ptr [ebp - 0x78], 0x74
            //   c6458979             | mov                 byte ptr [ebp - 0x77], 0x79

    condition:
        7 of them and filesize < 81920
}