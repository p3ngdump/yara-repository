rule win_joao_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.joao."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.joao"
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
        $sequence_0 = { 6a00 6a10 6800100000 b9???????? }
            // n = 4, score = 400
            //   6a00                 | push                0
            //   6a10                 | push                0x10
            //   6800100000           | push                0x1000
            //   b9????????           |                     

        $sequence_1 = { 833f10 720e 8b03 50 e8???????? 8b4510 }
            // n = 6, score = 400
            //   833f10               | cmp                 dword ptr [edi], 0x10
            //   720e                 | jb                  0x10
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_2 = { 8908 8d4804 83c704 c741140f000000 895110 }
            // n = 5, score = 400
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8d4804               | lea                 ecx, [eax + 4]
            //   83c704               | add                 edi, 4
            //   c741140f000000       | mov                 dword ptr [ecx + 0x14], 0xf
            //   895110               | mov                 dword ptr [ecx + 0x10], edx

        $sequence_3 = { e8???????? 8be5 5d c20400 8b4de0 8b55e4 68???????? }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   68????????           |                     

        $sequence_4 = { 8bf1 ff15???????? 8b7d10 8bd8 85ff }
            // n = 5, score = 400
            //   8bf1                 | mov                 esi, ecx
            //   ff15????????         |                     
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   8bd8                 | mov                 ebx, eax
            //   85ff                 | test                edi, edi

        $sequence_5 = { 50 c645fc02 e8???????? 8b5de4 83c404 8945d8 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   e8????????           |                     
            //   8b5de4               | mov                 ebx, dword ptr [ebp - 0x1c]
            //   83c404               | add                 esp, 4
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax

        $sequence_6 = { 68???????? 53 ff15???????? 8b550c 8b4d08 6a00 52 }
            // n = 7, score = 400
            //   68????????           |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   6a00                 | push                0
            //   52                   | push                edx

        $sequence_7 = { c7070f000000 c747fc00000000 c60300 3bd1 745f 833f10 720e }
            // n = 7, score = 400
            //   c7070f000000         | mov                 dword ptr [edi], 0xf
            //   c747fc00000000       | mov                 dword ptr [edi - 4], 0
            //   c60300               | mov                 byte ptr [ebx], 0
            //   3bd1                 | cmp                 edx, ecx
            //   745f                 | je                  0x61
            //   833f10               | cmp                 dword ptr [edi], 0x10
            //   720e                 | jb                  0x10

        $sequence_8 = { 2bc6 50 52 8d4db4 e8???????? 6a02 68???????? }
            // n = 7, score = 400
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   52                   | push                edx
            //   8d4db4               | lea                 ecx, [ebp - 0x4c]
            //   e8????????           |                     
            //   6a02                 | push                2
            //   68????????           |                     

        $sequence_9 = { 83c404 bf09000000 b8???????? 897dd0 }
            // n = 4, score = 400
            //   83c404               | add                 esp, 4
            //   bf09000000           | mov                 edi, 9
            //   b8????????           |                     
            //   897dd0               | mov                 dword ptr [ebp - 0x30], edi

    condition:
        7 of them and filesize < 2867200
}