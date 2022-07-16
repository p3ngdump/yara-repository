rule win_exaramel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.exaramel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.exaramel"
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
        $sequence_0 = { 83c404 85c0 7411 8d85ecfbffff 50 e8???????? 83c404 }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7411                 | je                  0x13
            //   8d85ecfbffff         | lea                 eax, [ebp - 0x414]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_1 = { 6a00 50 8d85f4fdffff 50 ff15???????? }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8d85f4fdffff         | lea                 eax, [ebp - 0x20c]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { ff760c e8???????? 56 e8???????? 8b4dfc }
            // n = 5, score = 100
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_3 = { ff7604 ff15???????? 56 e8???????? 83c404 33c0 5e }
            // n = 7, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   ff15????????         |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi

        $sequence_4 = { 8d1c8530e14100 8b03 8b15???????? 83cfff 8bca 8bf2 83e11f }
            // n = 7, score = 100
            //   8d1c8530e14100       | lea                 ebx, [eax*4 + 0x41e130]
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   8b15????????         |                     
            //   83cfff               | or                  edi, 0xffffffff
            //   8bca                 | mov                 ecx, edx
            //   8bf2                 | mov                 esi, edx
            //   83e11f               | and                 ecx, 0x1f

        $sequence_5 = { 50 ff760c ff36 ff15???????? 894604 85c0 7407 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   ff36                 | push                dword ptr [esi]
            //   ff15????????         |                     
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9

        $sequence_6 = { 6a00 6a00 6803800000 ff75f8 ff15???????? 85c0 0f84bc000000 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6803800000           | push                0x8003
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f84bc000000         | je                  0xc2

        $sequence_7 = { 6a00 57 ff15???????? 85c0 7561 ff15???????? }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7561                 | jne                 0x63
            //   ff15????????         |                     

        $sequence_8 = { 85c0 7909 b801000000 8be5 5d c3 6a08 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7909                 | jns                 0xb
            //   b801000000           | mov                 eax, 1
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a08                 | push                8

        $sequence_9 = { ff33 ff15???????? 8b1d???????? 85c0 }
            // n = 4, score = 100
            //   ff33                 | push                dword ptr [ebx]
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 294912
}