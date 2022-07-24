rule win_babuk_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.babuk."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.babuk"
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
        $sequence_0 = { ff15???????? 85c0 0f85ea000000 ff15???????? }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f85ea000000         | jne                 0xf0
            //   ff15????????         |                     

        $sequence_1 = { c1e005 8b4d08 8b54010c 83e202 7414 }
            // n = 5, score = 900
            //   c1e005               | shl                 eax, 5
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b54010c             | mov                 edx, dword ptr [ecx + eax + 0xc]
            //   83e202               | and                 edx, 2
            //   7414                 | je                  0x16

        $sequence_2 = { 0f85ea000000 ff15???????? 3dea000000 0f85d9000000 }
            // n = 4, score = 900
            //   0f85ea000000         | jne                 0xf0
            //   ff15????????         |                     
            //   3dea000000           | cmp                 eax, 0xea
            //   0f85d9000000         | jne                 0xdf

        $sequence_3 = { e8???????? e8???????? e8???????? 6a07 6a00 6a00 ff15???????? }
            // n = 7, score = 900
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   6a07                 | push                7
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_4 = { 51 6a13 6a00 6a02 e8???????? 85c0 }
            // n = 6, score = 900
            //   51                   | push                ecx
            //   6a13                 | push                0x13
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_5 = { c1e005 8b4d08 8b54010c 83e202 }
            // n = 4, score = 900
            //   c1e005               | shl                 eax, 5
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b54010c             | mov                 edx, dword ptr [ecx + eax + 0xc]
            //   83e202               | and                 edx, 2

        $sequence_6 = { 85c0 0f85ea000000 ff15???????? 3dea000000 }
            // n = 4, score = 900
            //   85c0                 | test                eax, eax
            //   0f85ea000000         | jne                 0xf0
            //   ff15????????         |                     
            //   3dea000000           | cmp                 eax, 0xea

        $sequence_7 = { e8???????? e8???????? e8???????? 6a07 6a00 }
            // n = 5, score = 900
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   6a07                 | push                7
            //   6a00                 | push                0

        $sequence_8 = { c745f800000000 e8???????? 85c0 742d }
            // n = 4, score = 900
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   742d                 | je                  0x2f

        $sequence_9 = { e8???????? e8???????? 6a07 6a00 6a00 ff15???????? }
            // n = 6, score = 900
            //   e8????????           |                     
            //   e8????????           |                     
            //   6a07                 | push                7
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 183296
}