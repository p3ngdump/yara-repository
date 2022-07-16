rule win_spyder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.spyder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spyder"
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
        $sequence_0 = { 7232 488d4b04 4c8d05a33e0000 ba16000000 e8???????? 85c0 }
            // n = 6, score = 500
            //   7232                 | test                eax, eax
            //   488d4b04             | je                  0x1b
            //   4c8d05a33e0000       | dec                 eax
            //   ba16000000           | lea                 edx, [0xa483]
            //   e8????????           |                     
            //   85c0                 | dec                 eax

        $sequence_1 = { 482bfb 0f1f8000000000 4c8b4638 498bcc 0fb7d0 4985c6 7505 }
            // n = 7, score = 500
            //   482bfb               | dec                 eax
            //   0f1f8000000000       | lea                 ecx, [0x3313]
            //   4c8b4638             | dec                 eax
            //   498bcc               | lea                 ebx, [0xa2a7]
            //   0fb7d0               | dec                 eax
            //   4985c6               | lea                 edi, [0xa2a8]
            //   7505                 | jmp                 0x1e

        $sequence_2 = { 4885c0 0f847a010000 488bc8 ff15???????? 488d15385f0000 488bce 488905???????? }
            // n = 7, score = 500
            //   4885c0               | lea                 eax, [0x3ea3]
            //   0f847a010000         | mov                 edx, 0x16
            //   488bc8               | test                eax, eax
            //   ff15????????         |                     
            //   488d15385f0000       | dec                 eax
            //   488bce               | lea                 ecx, [0x3313]
            //   488905????????       |                     

        $sequence_3 = { 488d0d13330000 e8???????? 488d1da7a20000 488d3da8a20000 eb0e 488b03 }
            // n = 6, score = 500
            //   488d0d13330000       | mov                 ecx, eax
            //   e8????????           |                     
            //   488d1da7a20000       | jb                  0x34
            //   488d3da8a20000       | dec                 eax
            //   eb0e                 | lea                 ecx, [ebx + 4]
            //   488b03               | dec                 esp

        $sequence_4 = { 488d0525160000 488d0d6e210000 488905???????? 488d0500160000 }
            // n = 4, score = 500
            //   488d0525160000       | test                eax, eax
            //   488d0d6e210000       | je                  0x183
            //   488905????????       |                     
            //   488d0500160000       | dec                 eax

        $sequence_5 = { 4c8d05fc890000 498bd4 488bcd e8???????? 85c0 7541 4c8bc3 }
            // n = 7, score = 500
            //   4c8d05fc890000       | mov                 ecx, eax
            //   498bd4               | dec                 eax
            //   488bcd               | lea                 edx, [0x5f38]
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   7541                 | mov                 ecx, esi
            //   4c8bc3               | jne                 0x5c

        $sequence_6 = { 488d3d88930000 eb0e 488b03 4885c0 7402 ffd0 }
            // n = 6, score = 500
            //   488d3d88930000       | dec                 eax
            //   eb0e                 | lea                 edi, [0x9388]
            //   488b03               | jmp                 0x10
            //   4885c0               | dec                 eax
            //   7402                 | mov                 eax, dword ptr [ebx]
            //   ffd0                 | dec                 eax

        $sequence_7 = { 4885c0 7419 488d1583a40000 488bc8 }
            // n = 4, score = 500
            //   4885c0               | test                eax, eax
            //   7419                 | je                  7
            //   488d1583a40000       | call                eax
            //   488bc8               | dec                 eax

        $sequence_8 = { 8b03 83c404 8b4028 85c0 7430 6a00 }
            // n = 6, score = 100
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   83c404               | add                 esp, 4
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]
            //   85c0                 | test                eax, eax
            //   7430                 | je                  0x32
            //   6a00                 | push                0

        $sequence_9 = { 740e 50 ff15???????? 830d????????ff c3 8b442404 c74050c03e0910 }
            // n = 7, score = 100
            //   740e                 | je                  0x10
            //   50                   | push                eax
            //   ff15????????         |                     
            //   830d????????ff       |                     
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   c74050c03e0910       | mov                 dword ptr [eax + 0x50], 0x10093ec0

        $sequence_10 = { 8a9405ecfdffff 889000490910 eb1c f6c202 7410 }
            // n = 5, score = 100
            //   8a9405ecfdffff       | mov                 dl, byte ptr [ebp + eax - 0x214]
            //   889000490910         | mov                 byte ptr [eax + 0x10094900], dl
            //   eb1c                 | jmp                 0x1e
            //   f6c202               | test                dl, 2
            //   7410                 | je                  0x12

        $sequence_11 = { 682b010000 8bf7 8be9 8bfa }
            // n = 4, score = 100
            //   682b010000           | push                0x12b
            //   8bf7                 | mov                 esi, edi
            //   8be9                 | mov                 ebp, ecx
            //   8bfa                 | mov                 edi, edx

        $sequence_12 = { eb26 8d4508 8db6ec3c0910 6a00 50 ff36 }
            // n = 6, score = 100
            //   eb26                 | jmp                 0x28
            //   8d4508               | lea                 eax, [ebp + 8]
            //   8db6ec3c0910         | lea                 esi, [esi + 0x10093cec]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff36                 | push                dword ptr [esi]

        $sequence_13 = { 50 68???????? 68ff070000 51 e8???????? a1???????? 83c41c }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   68ff070000           | push                0x7ff
            //   51                   | push                ecx
            //   e8????????           |                     
            //   a1????????           |                     
            //   83c41c               | add                 esp, 0x1c

        $sequence_14 = { 50 51 68???????? 8d54243c 68c7000000 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   68????????           |                     
            //   8d54243c             | lea                 edx, [esp + 0x3c]
            //   68c7000000           | push                0xc7

        $sequence_15 = { ebf8 55 8bec 53 56 be???????? 57 }
            // n = 7, score = 100
            //   ebf8                 | jmp                 0xfffffffa
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   53                   | push                ebx
            //   56                   | push                esi
            //   be????????           |                     
            //   57                   | push                edi

    condition:
        7 of them and filesize < 1458176
}