rule win_coredn_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.coredn."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.coredn"
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
        $sequence_0 = { 51 56 8d45fc 8bf1 50 e8???????? 85c0 }
            // n = 7, score = 600
            //   51                   | push                ecx
            //   56                   | push                esi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   8bf1                 | mov                 esi, ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 40 83f840 72f2 eb12 8b4e08 83c00c }
            // n = 6, score = 400
            //   40                   | inc                 eax
            //   83f840               | cmp                 eax, 0x40
            //   72f2                 | jb                  0xfffffff4
            //   eb12                 | jmp                 0x14
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   83c00c               | add                 eax, 0xc

        $sequence_2 = { 85c0 7420 8a040f 84c0 7419 }
            // n = 5, score = 400
            //   85c0                 | test                eax, eax
            //   7420                 | je                  0x22
            //   8a040f               | mov                 al, byte ptr [edi + ecx]
            //   84c0                 | test                al, al
            //   7419                 | je                  0x1b

        $sequence_3 = { 8a1c06 84db 741c 8818 4a 40 }
            // n = 6, score = 400
            //   8a1c06               | mov                 bl, byte ptr [esi + eax]
            //   84db                 | test                bl, bl
            //   741c                 | je                  0x1e
            //   8818                 | mov                 byte ptr [eax], bl
            //   4a                   | dec                 edx
            //   40                   | inc                 eax

        $sequence_4 = { 784f 53 56 33db 57 85d2 7438 }
            // n = 7, score = 400
            //   784f                 | js                  0x51
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   85d2                 | test                edx, edx
            //   7438                 | je                  0x3a

        $sequence_5 = { 83ea01 75e7 8851ff b87a000780 }
            // n = 4, score = 400
            //   83ea01               | sub                 edx, 1
            //   75e7                 | jne                 0xffffffe9
            //   8851ff               | mov                 byte ptr [ecx - 1], dl
            //   b87a000780           | mov                 eax, 0x8007007a

        $sequence_6 = { 48 bf7a000780 c60000 8bc7 5f 5b }
            // n = 6, score = 400
            //   48                   | dec                 eax
            //   bf7a000780           | mov                 edi, 0x8007007a
            //   c60000               | mov                 byte ptr [eax], 0
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_7 = { 5f 5e 8bc3 8811 }
            // n = 4, score = 400
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8bc3                 | mov                 eax, ebx
            //   8811                 | mov                 byte ptr [ecx], dl

        $sequence_8 = { 85d2 7438 8b7d08 befeffff7f }
            // n = 4, score = 400
            //   85d2                 | test                edx, edx
            //   7438                 | je                  0x3a
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   befeffff7f           | mov                 esi, 0x7ffffffe

        $sequence_9 = { 84c0 7415 8801 41 83ea01 }
            // n = 5, score = 400
            //   84c0                 | test                al, al
            //   7415                 | je                  0x17
            //   8801                 | mov                 byte ptr [ecx], al
            //   41                   | inc                 ecx
            //   83ea01               | sub                 edx, 1

        $sequence_10 = { 51 e8???????? 8bcb 83c40c 8d5101 8a01 41 }
            // n = 7, score = 400
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   83c40c               | add                 esp, 0xc
            //   8d5101               | lea                 edx, [ecx + 1]
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   41                   | inc                 ecx

        $sequence_11 = { 6690 8d82fafeff7f 85c0 741c }
            // n = 4, score = 400
            //   6690                 | nop                 
            //   8d82fafeff7f         | lea                 eax, [edx + 0x7ffffefa]
            //   85c0                 | test                eax, eax
            //   741c                 | je                  0x1e

        $sequence_12 = { 5f 5b 5e 8be5 5d c20400 85c9 }
            // n = 7, score = 400
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   85c9                 | test                ecx, ecx

        $sequence_13 = { 2bf0 85d2 7423 8a1c06 }
            // n = 4, score = 400
            //   2bf0                 | sub                 esi, eax
            //   85d2                 | test                edx, edx
            //   7423                 | je                  0x25
            //   8a1c06               | mov                 bl, byte ptr [esi + eax]

        $sequence_14 = { 8d4e20 51 6a00 50 }
            // n = 4, score = 400
            //   8d4e20               | lea                 ecx, [esi + 0x20]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_15 = { 50 e8???????? 8b4e08 8d5701 }
            // n = 4, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   8d5701               | lea                 edx, [edi + 1]

    condition:
        7 of them and filesize < 385024
}