rule win_mount_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mount_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mount_locker"
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
        $sequence_0 = { 4156 4883ec30 498be8 4d8bc8 4c8bc2 4c8bf2 8bf1 }
            // n = 7, score = 300
            //   4156                 | dec                 eax
            //   4883ec30             | shl                 eax, 4
            //   498be8               | dec                 eax
            //   4d8bc8               | add                 eax, ebx
            //   4c8bc2               | cmp                 dword ptr [eax + 8], 3
            //   4c8bf2               | jne                 0x135f
            //   8bf1                 | cmp                 ebp, 2

        $sequence_1 = { 4883ec40 488bd9 ff15???????? 4c8d442458 ba28000000 488bc8 ff15???????? }
            // n = 7, score = 300
            //   4883ec40             | mov                 eax, edi
            //   488bd9               | dec                 eax
            //   ff15????????         |                     
            //   4c8d442458           | lea                 ecx, [esp + 0x30]
            //   ba28000000           | dec                 eax
            //   488bc8               | mov                 edx, eax
            //   ff15????????         |                     

        $sequence_2 = { 8bd8 85c0 7433 488364242800 4c8d442430 }
            // n = 5, score = 300
            //   8bd8                 | sub                 esp, 0x60
            //   85c0                 | xor                 esi, esi
            //   7433                 | movaps              xmmword ptr [eax - 0x18], xmm6
            //   488364242800         | dec                 eax
            //   4c8d442430           | mov                 dword ptr [eax + 0x18], esi

        $sequence_3 = { 488364242000 4c8d4c2468 448bc7 488bd3 ff15???????? }
            // n = 5, score = 300
            //   488364242000         | add                 eax, ecx
            //   4c8d4c2468           | mov                 edi, eax
            //   448bc7               | mov                 dword ptr [esp + 0x88], eax
            //   488bd3               | rol                 ecx, 0xc
            //   ff15????????         |                     

        $sequence_4 = { 488b4c2458 33d2 c744243001000000 c744243c02000000 ff15???????? 8bd8 }
            // n = 6, score = 300
            //   488b4c2458           | mov                 ecx, esi
            //   33d2                 | dec                 eax
            //   c744243001000000     | mov                 ecx, eax
            //   c744243c02000000     | lea                 ecx, [edi + 8]
            //   ff15????????         |                     
            //   8bd8                 | dec                 esp

        $sequence_5 = { 41d1e9 c744242804010000 4889442420 ff15???????? 85c0 7809 }
            // n = 6, score = 300
            //   41d1e9               | dec                 eax
            //   c744242804010000     | sub                 esi, 1
            //   4889442420           | je                  0x11a
            //   ff15????????         |                     
            //   85c0                 | dec                 eax
            //   7809                 | and                 dword ptr [ebx - 8], 0

        $sequence_6 = { 41b814010000 ff15???????? 8bd8 85c0 743b 488b4d6f 488d4567 }
            // n = 7, score = 300
            //   41b814010000         | dec                 eax
            //   ff15????????         |                     
            //   8bd8                 | mov                 eax, dword ptr [ecx]
            //   85c0                 | call                dword ptr [eax + 0x28]
            //   743b                 | dec                 eax
            //   488b4d6f             | mov                 ecx, dword ptr [ebp - 0x10]
            //   488d4567             | dec                 eax

        $sequence_7 = { 488b4d6f 8bd8 ff15???????? 488b4d77 33d2 ff15???????? 85db }
            // n = 7, score = 300
            //   488b4d6f             | dec                 esp
            //   8bd8                 | lea                 eax, [0x4b7e]
            //   ff15????????         |                     
            //   488b4d77             | jmp                 0x5fe
            //   33d2                 | dec                 eax
            //   ff15????????         |                     
            //   85db                 | lea                 edx, [0x4b9d]

        $sequence_8 = { 488bcb ff15???????? 4c8b05???????? 488bcb 488b15???????? e8???????? }
            // n = 6, score = 300
            //   488bcb               | lea                 ecx, [esi + ebp]
            //   ff15????????         |                     
            //   4c8b05????????       |                     
            //   488bcb               | inc                 ecx
            //   488b15????????       |                     
            //   e8????????           |                     

        $sequence_9 = { 5d c3 bb68000000 488d4c2450 448bc3 33d2 }
            // n = 6, score = 300
            //   5d                   | xor                 ebx, ebx
            //   c3                   | cmp                 eax, 0x80041064
            //   bb68000000           | jne                 0x4db
            //   488d4c2450           | dec                 esp
            //   448bc3               | mov                 ecx, dword ptr [esp + 0x28]
            //   33d2                 | inc                 ebp

    condition:
        7 of them and filesize < 225280
}