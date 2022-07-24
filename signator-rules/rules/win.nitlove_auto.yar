rule win_nitlove_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.nitlove."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nitlove"
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
        $sequence_0 = { 57 8d85fcfeffff ba439d23fd 50 53 6aff b9???????? }
            // n = 7, score = 200
            //   57                   | push                edi
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   ba439d23fd           | mov                 edx, 0xfd239d43
            //   50                   | push                eax
            //   53                   | push                ebx
            //   6aff                 | push                -1
            //   b9????????           |                     

        $sequence_1 = { 83650c00 660f1345d0 8955dc 8945c4 }
            // n = 4, score = 200
            //   83650c00             | and                 dword ptr [ebp + 0xc], 0
            //   660f1345d0           | movlpd              qword ptr [ebp - 0x30], xmm0
            //   8955dc               | mov                 dword ptr [ebp - 0x24], edx
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax

        $sequence_2 = { 8b02 49 83c208 8945f8 }
            // n = 4, score = 200
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   49                   | dec                 ecx
            //   83c208               | add                 edx, 8
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_3 = { b9???????? 837dec00 7518 ff75f0 ba439d23fd 50 ff75e4 }
            // n = 7, score = 200
            //   b9????????           |                     
            //   837dec00             | cmp                 dword ptr [ebp - 0x14], 0
            //   7518                 | jne                 0x1a
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ba439d23fd           | mov                 edx, 0xfd239d43
            //   50                   | push                eax
            //   ff75e4               | push                dword ptr [ebp - 0x1c]

        $sequence_4 = { 8b0d???????? c60603 8b45f0 8b14d564404000 40 6a00 6a00 }
            // n = 7, score = 200
            //   8b0d????????         |                     
            //   c60603               | mov                 byte ptr [esi], 3
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b14d564404000       | mov                 edx, dword ptr [edx*8 + 0x404064]
            //   40                   | inc                 eax
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_5 = { 8945fc 3bf8 0f83da000000 53 }
            // n = 4, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   3bf8                 | cmp                 edi, eax
            //   0f83da000000         | jae                 0xe0
            //   53                   | push                ebx

        $sequence_6 = { bab4bee456 b9???????? e8???????? ffd0 8bd3 3817 7415 }
            // n = 7, score = 200
            //   bab4bee456           | mov                 edx, 0x56e4beb4
            //   b9????????           |                     
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   8bd3                 | mov                 edx, ebx
            //   3817                 | cmp                 byte ptr [edi], dl
            //   7415                 | je                  0x17

        $sequence_7 = { 68e8030000 ba784c98aa b9???????? e8???????? ffd0 }
            // n = 5, score = 200
            //   68e8030000           | push                0x3e8
            //   ba784c98aa           | mov                 edx, 0xaa984c78
            //   b9????????           |                     
            //   e8????????           |                     
            //   ffd0                 | call                eax

        $sequence_8 = { 8bd3 e8???????? ffd0 57 bf???????? 8bd3 }
            // n = 6, score = 200
            //   8bd3                 | mov                 edx, ebx
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   57                   | push                edi
            //   bf????????           |                     
            //   8bd3                 | mov                 edx, ebx

        $sequence_9 = { c3 55 8bec 81ec04010000 ba07d457d6 }
            // n = 5, score = 200
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec04010000         | sub                 esp, 0x104
            //   ba07d457d6           | mov                 edx, 0xd657d407

    condition:
        7 of them and filesize < 49152
}