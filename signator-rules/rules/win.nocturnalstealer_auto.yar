rule win_nocturnalstealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.nocturnalstealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nocturnalstealer"
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
        $sequence_0 = { e9???????? 81e603f1f64d 81e6ca0bb97f 81e654ce3d0d e9???????? 81c404000000 29f3 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   81e603f1f64d         | and                 esi, 0x4df6f103
            //   81e6ca0bb97f         | and                 esi, 0x7fb90bca
            //   81e654ce3d0d         | and                 esi, 0xd3dce54
            //   e9????????           |                     
            //   81c404000000         | add                 esp, 4
            //   29f3                 | sub                 ebx, esi

        $sequence_1 = { 81e200080000 81ca28000000 81ca1f000000 2b0b 89e8 81ea00000080 81c2ffffff7f }
            // n = 7, score = 100
            //   81e200080000         | and                 edx, 0x800
            //   81ca28000000         | or                  edx, 0x28
            //   81ca1f000000         | or                  edx, 0x1f
            //   2b0b                 | sub                 ecx, dword ptr [ebx]
            //   89e8                 | mov                 eax, ebp
            //   81ea00000080         | sub                 edx, 0x80000000
            //   81c2ffffff7f         | add                 edx, 0x7fffffff

        $sequence_2 = { e9???????? 81c704000000 81c704000000 873c24 5c 83ec04 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   81c704000000         | add                 edi, 4
            //   81c704000000         | add                 edi, 4
            //   873c24               | xchg                dword ptr [esp], edi
            //   5c                   | pop                 esp
            //   83ec04               | sub                 esp, 4
            //   e9????????           |                     

        $sequence_3 = { e9???????? bbbf993e77 56 e9???????? c704245180a71d 891424 ff3424 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   bbbf993e77           | mov                 ebx, 0x773e99bf
            //   56                   | push                esi
            //   e9????????           |                     
            //   c704245180a71d       | mov                 dword ptr [esp], 0x1da78051
            //   891424               | mov                 dword ptr [esp], edx
            //   ff3424               | push                dword ptr [esp]

        $sequence_4 = { fb 50 893424 be2e143e5f c1ee07 52 e9???????? }
            // n = 7, score = 100
            //   fb                   | sti                 
            //   50                   | push                eax
            //   893424               | mov                 dword ptr [esp], esi
            //   be2e143e5f           | mov                 esi, 0x5f3e142e
            //   c1ee07               | shr                 esi, 7
            //   52                   | push                edx
            //   e9????????           |                     

        $sequence_5 = { 8b12 81e924000000 81cf00000080 3524000000 81ef00000080 01ee 09d8 }
            // n = 7, score = 100
            //   8b12                 | mov                 edx, dword ptr [edx]
            //   81e924000000         | sub                 ecx, 0x24
            //   81cf00000080         | or                  edi, 0x80000000
            //   3524000000           | xor                 eax, 0x24
            //   81ef00000080         | sub                 edi, 0x80000000
            //   01ee                 | add                 esi, ebp
            //   09d8                 | or                  eax, ebx

        $sequence_6 = { 8b12 81c7a2000000 89f8 89ef 81c205000000 0fb70a 81c75b000000 }
            // n = 7, score = 100
            //   8b12                 | mov                 edx, dword ptr [edx]
            //   81c7a2000000         | add                 edi, 0xa2
            //   89f8                 | mov                 eax, edi
            //   89ef                 | mov                 edi, ebp
            //   81c205000000         | add                 edx, 5
            //   0fb70a               | movzx               ecx, word ptr [edx]
            //   81c75b000000         | add                 edi, 0x5b

        $sequence_7 = { ff742404 5b 8f0424 5c 687986694c 893424 54 }
            // n = 7, score = 100
            //   ff742404             | push                dword ptr [esp + 4]
            //   5b                   | pop                 ebx
            //   8f0424               | pop                 dword ptr [esp]
            //   5c                   | pop                 esp
            //   687986694c           | push                0x4c698679
            //   893424               | mov                 dword ptr [esp], esi
            //   54                   | push                esp

        $sequence_8 = { f7d9 e9???????? ba68a67a7f 09d6 5a 51 53 }
            // n = 7, score = 100
            //   f7d9                 | neg                 ecx
            //   e9????????           |                     
            //   ba68a67a7f           | mov                 edx, 0x7f7aa668
            //   09d6                 | or                  esi, edx
            //   5a                   | pop                 edx
            //   51                   | push                ecx
            //   53                   | push                ebx

        $sequence_9 = { e9???????? 89e1 53 bb04000000 01d9 5b 81c104000000 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   89e1                 | mov                 ecx, esp
            //   53                   | push                ebx
            //   bb04000000           | mov                 ebx, 4
            //   01d9                 | add                 ecx, ebx
            //   5b                   | pop                 ebx
            //   81c104000000         | add                 ecx, 4

    condition:
        7 of them and filesize < 10739712
}