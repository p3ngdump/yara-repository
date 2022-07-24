rule win_nokki_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.nokki."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nokki"
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
        $sequence_0 = { e8???????? 33d2 68ce070000 52 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   33d2                 | xor                 edx, edx
            //   68ce070000           | push                0x7ce
            //   52                   | push                edx

        $sequence_1 = { e8???????? 33c9 68ce070000 51 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   68ce070000           | push                0x7ce
            //   51                   | push                ecx

        $sequence_2 = { 55 8bec b8ec170000 e8???????? a1???????? 33c5 8945fc }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b8ec170000           | mov                 eax, 0x17ec
            //   e8????????           |                     
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_3 = { 6a1e 68???????? 8bce 8bf8 e8???????? 57 }
            // n = 6, score = 100
            //   6a1e                 | push                0x1e
            //   68????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   57                   | push                edi

        $sequence_4 = { 68???????? 6a00 ffd6 68???????? ffd7 68???????? 68???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   6a00                 | push                0
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   68????????           |                     

        $sequence_5 = { 8b4204 57 ffd0 8b8d34d4ffff 83c110 }
            // n = 5, score = 100
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   57                   | push                edi
            //   ffd0                 | call                eax
            //   8b8d34d4ffff         | mov                 ecx, dword ptr [ebp - 0x2bcc]
            //   83c110               | add                 ecx, 0x10

        $sequence_6 = { ff15???????? 6a06 8bce 85c0 7507 68???????? eb05 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   6a06                 | push                6
            //   8bce                 | mov                 ecx, esi
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   68????????           |                     
            //   eb05                 | jmp                 7

        $sequence_7 = { ff15???????? 8bf0 85f6 7463 6a00 6a02 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7463                 | je                  0x65
            //   6a00                 | push                0
            //   6a02                 | push                2

        $sequence_8 = { 8bc7 c1f805 8bf7 83e61f c1e606 03348580054100 }
            // n = 6, score = 100
            //   8bc7                 | mov                 eax, edi
            //   c1f805               | sar                 eax, 5
            //   8bf7                 | mov                 esi, edi
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   03348580054100       | add                 esi, dword ptr [eax*4 + 0x410580]

        $sequence_9 = { e8???????? 8bc6 c1f805 8b048580054100 83e61f }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   c1f805               | sar                 eax, 5
            //   8b048580054100       | mov                 eax, dword ptr [eax*4 + 0x410580]
            //   83e61f               | and                 esi, 0x1f

        $sequence_10 = { 8bf7 83e61f 8bc7 c1f805 c1e606 033485c02b4100 8b45f8 }
            // n = 7, score = 100
            //   8bf7                 | mov                 esi, edi
            //   83e61f               | and                 esi, 0x1f
            //   8bc7                 | mov                 eax, edi
            //   c1f805               | sar                 eax, 5
            //   c1e606               | shl                 esi, 6
            //   033485c02b4100       | add                 esi, dword ptr [eax*4 + 0x412bc0]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_11 = { 50 51 8d5584 68???????? 52 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8d5584               | lea                 edx, [ebp - 0x7c]
            //   68????????           |                     
            //   52                   | push                edx

        $sequence_12 = { 8b4508 85c0 0f84ff000000 56 0fb7c0 68???????? }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   85c0                 | test                eax, eax
            //   0f84ff000000         | je                  0x105
            //   56                   | push                esi
            //   0fb7c0               | movzx               eax, ax
            //   68????????           |                     

        $sequence_13 = { 56 56 8d8d14f8ffff 51 8d9520f8ffff }
            // n = 5, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   8d8d14f8ffff         | lea                 ecx, [ebp - 0x7ec]
            //   51                   | push                ecx
            //   8d9520f8ffff         | lea                 edx, [ebp - 0x7e0]

    condition:
        7 of them and filesize < 454656
}