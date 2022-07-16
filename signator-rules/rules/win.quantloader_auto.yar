rule win_quantloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.quantloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.quantloader"
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
        $sequence_0 = { c744241002000000 c744240c00000000 c744240803000000 c744240400000040 }
            // n = 4, score = 500
            //   c744241002000000     | mov                 dword ptr [esp + 0x10], 2
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240803000000     | mov                 dword ptr [esp + 8], 3
            //   c744240400000040     | mov                 dword ptr [esp + 4], 0x40000000

        $sequence_1 = { 85c0 7516 8b45f8 40 8945f4 807dff00 }
            // n = 6, score = 500
            //   85c0                 | test                eax, eax
            //   7516                 | jne                 0x18
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   40                   | inc                 eax
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   807dff00             | cmp                 byte ptr [ebp - 1], 0

        $sequence_2 = { 741c 8b45ec 890424 e8???????? 83ec04 c745ec00000000 c745f000000000 }
            // n = 7, score = 500
            //   741c                 | je                  0x1e
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0

        $sequence_3 = { c7042400000000 e8???????? 83ec28 85c0 7416 c7442404ffffffff 8b4598 }
            // n = 7, score = 500
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   e8????????           |                     
            //   83ec28               | sub                 esp, 0x28
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   c7442404ffffffff     | mov                 dword ptr [esp + 4], 0xffffffff
            //   8b4598               | mov                 eax, dword ptr [ebp - 0x68]

        $sequence_4 = { 89442404 8d85f8fdffff 890424 e8???????? e8???????? 89442404 8d85f8fdffff }
            // n = 7, score = 500
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]

        $sequence_5 = { 8b4508 890424 e8???????? 85c0 7e58 }
            // n = 5, score = 500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7e58                 | jle                 0x5a

        $sequence_6 = { 7527 8d85f8fdffff 890424 e8???????? c744240400000000 8d85f8fdffff }
            // n = 6, score = 500
            //   7527                 | jne                 0x29
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]

        $sequence_7 = { 0fb745f0 890424 e8???????? 89442404 c70424???????? e8???????? }
            // n = 6, score = 500
            //   0fb745f0             | movzx               eax, word ptr [ebp - 0x10]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   c70424????????       |                     
            //   e8????????           |                     

        $sequence_8 = { 8bd8 54 53 ff5534 8b4c241c 8bc1 }
            // n = 6, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   54                   | push                esp
            //   53                   | push                ebx
            //   ff5534               | call                dword ptr [ebp + 0x34]
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   8bc1                 | mov                 eax, ecx

        $sequence_9 = { 8b456c 85c0 7415 89463c 52 ba04000000 e8???????? }
            // n = 7, score = 100
            //   8b456c               | mov                 eax, dword ptr [ebp + 0x6c]
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17
            //   89463c               | mov                 dword ptr [esi + 0x3c], eax
            //   52                   | push                edx
            //   ba04000000           | mov                 edx, 4
            //   e8????????           |                     

        $sequence_10 = { 41 2bc2 7804 7402 ebf7 33c0 }
            // n = 6, score = 100
            //   41                   | inc                 ecx
            //   2bc2                 | sub                 eax, edx
            //   7804                 | js                  6
            //   7402                 | je                  4
            //   ebf7                 | jmp                 0xfffffff9
            //   33c0                 | xor                 eax, eax

        $sequence_11 = { 57 ad 85c0 741b a900000080 7504 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   a900000080           | test                eax, 0x80000000
            //   7504                 | jne                 6

        $sequence_12 = { 5a 03f0 03f8 2bc8 }
            // n = 4, score = 100
            //   5a                   | pop                 edx
            //   03f0                 | add                 esi, eax
            //   03f8                 | add                 edi, eax
            //   2bc8                 | sub                 ecx, eax

        $sequence_13 = { 011407 e2ee 59 8d442404 51 52 50 }
            // n = 7, score = 100
            //   011407               | add                 dword ptr [edi + eax], edx
            //   e2ee                 | loop                0xfffffff0
            //   59                   | pop                 ecx
            //   8d442404             | lea                 eax, [esp + 4]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_14 = { 8bc1 59 c3 60 837d5400 }
            // n = 5, score = 100
            //   8bc1                 | mov                 eax, ecx
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   60                   | pushal              
            //   837d5400             | cmp                 dword ptr [ebp + 0x54], 0

        $sequence_15 = { c3 60 8b557c c7457c00000000 81c243e15762 8b4d74 8bfe }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   60                   | pushal              
            //   8b557c               | mov                 edx, dword ptr [ebp + 0x7c]
            //   c7457c00000000       | mov                 dword ptr [ebp + 0x7c], 0
            //   81c243e15762         | add                 edx, 0x6257e143
            //   8b4d74               | mov                 ecx, dword ptr [ebp + 0x74]
            //   8bfe                 | mov                 edi, esi

    condition:
        7 of them and filesize < 155648
}